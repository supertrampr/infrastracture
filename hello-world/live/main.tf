terraform {
  # Providers block, terraform when initialized
  # will proceed to download every executable to communicate
  # with providers api.
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~>2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2.16.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~>2.7.1"
    }
    ovh = {
      source  = "ovh/ovh"
      version = "~>0.24.0"
    }
  }
  # This is the backend block, used by terraform
  # to know where to store the remote state.
  backend "s3" {}
}

# Additional properties scoped to the single provider.
provider "digitalocean" {
  token = var.do_token
}

provider "kubernetes" {
  host                   = module.doks_cluster.host
  token                  = module.doks_cluster.token
  cluster_ca_certificate = base64decode(module.doks_cluster.cluster_ca_certificate)

  # If you are having some trouble connecting with the configuration above use this instead.
  #  config_path    = "~/.kube/config"
  #  config_context = "do-fra1-doks-fra1-poc-neosyn"
}

provider "helm" {
  kubernetes {
    host                   = module.doks_cluster.host
    token                  = module.doks_cluster.token
    cluster_ca_certificate = base64decode(module.doks_cluster.cluster_ca_certificate)

    # If you are having some trouble connecting with the configuration above use this instead.
    #    config_path    = "~/.kube/config"
    #    config_context = "do-fra1-doks-fra1-poc-neosyn"
  }
}

provider "ovh" {
  endpoint           = "ovh-ca"
  application_key    = var.ovh_application_key    # "817f9ad67dd5fa52"
  application_secret = var.ovh_application_secret # "77d5b4950118c60ba79e51f4874d77bd"
  consumer_key       = var.ovh_consumer_key       # "a9a4418d04a63e55c895e9f6601ca20a"
}

module "vpc" {
  source = "../../modules/network/vpc"

  ip_range = var.vpc_ip_range
  name     = "vpc-${local.postfix}"
  region   = var.region
}

module "loadbalancer" {
  source = "../../modules/network/load-balancer"

  entry_port      = var.loadbalancer_entry_port
  entry_protocol  = var.loadbalancer_entry_protocol
  name            = "dolb-${local.postfix}"
  region          = var.region
  target_port     = var.loadbalancer_target_port
  target_protocol = var.loadbalancer_target_protocol
  vpc_id          = module.vpc.id
}

module "doks_cluster" {
  source = "../../modules/services/doks"

  k8s_version   = var.doks_cluster_k8s_version
  name          = "doks-${local.postfix}"
  nodepool_name = "nodes-${local.postfix}"
  nodepool_size = var.doks_cluster_nodepool_size
  region        = var.region
  nodes_count   = var.doks_cluster_nodes_count
  vpc_id        = module.vpc.id

  tags = var.tags
}

module "docr" {
  source = "../../modules/services/docr"

  name   = "docr-${local.postfix}"
  region = var.region
}

module "docr_credentials" {
  source = "../../modules/services/docr-credentials"

  registry_name = module.docr.name
}

module "namespace" {
  source = "../../modules/k8s/namespace"

  for_each = var.namespaces

  name = each.value

  depends_on = [
    module.doks_cluster
  ]
}

module "imagepull_secret" {
  source = "../../modules/k8s/secret"

  key       = var.imagepull_secret_key
  name      = var.imagepull_secret_name
  namespace = module.namespace["poc"].name
  type      = var.imagepull_secret_type
  value     = module.docr_credentials.value
}

module "nginx_ingress_controller" {
  source = "../../modules/helm/nginx-ingress-controller"

  load_balancer_id        = module.loadbalancer.id
  load_balancer_name      = module.loadbalancer.name
  load_balancer_public_ip = module.loadbalancer.ip
  load_balancer_hostname  = module.do_dns_record["workaround"].fqdn
  name                    = var.nginx_release_name
  namespace               = module.namespace["nginx"].name
}

module "cert_manager" {
  source = "../../modules/helm/cert-manager"

  name            = var.cert_manager_release_name
  namespace       = module.namespace["certmanager"].name
  cluster_issuers = var.cert_manager_cluster_issuers
  email           = var.cert_manager_email
}

module "ovh_domain_record" {
  source = "../../modules/network/ovh-domain-record"

  type      = var.ovh_domain_record_type
  subdomain = var.ovh_domain_record_subdomain
  target    = module.loadbalancer.ip
  ttl       = var.ovh_domain_record_ttl
  zone      = var.domain_name
}

module "do_domain" {
  source = "../../modules/network/do-domain"

  name = var.domain_name
}

module "do_dns_record" {
  source = "../../modules/network/do-dns-record"

  for_each = var.do_dns_record

  domain_name = module.do_domain.name
  name        = each.value["name"]
  type        = each.value["type"]
  value       = module.loadbalancer.ip
}