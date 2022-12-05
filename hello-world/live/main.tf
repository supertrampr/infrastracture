terraform {
  # Providers block, terraform when initialized
  # will proceed to download every executable to communicate
  # with providers api.
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

  # This is the backend block, used by terraform
  # to know where to store the remote state.
  backend "s3" {}

}

# Additional properties scoped to the single provider.
provider "digitalocean" {}

module "vpc" {
  source = "../../modules/network/vpc"

  ip_range = var.vpc_ip_range
  name     = "vpc-${local.postfix}"
  region   = var.region
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