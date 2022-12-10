# GLOBAL
region = "fra1"
env    = "poc"
owner  = "neosyn"
tags = [
  "deployedBy:terraform",
  "env:poc",
  "project:workshop",
  "owner:neosyn"
]
domain_name = "supertramp.online"

# DOKS
doks_cluster_k8s_version   = "1.25.4-do.0"
doks_cluster_nodepool_size = "s-2vcpu-4gb"
doks_cluster_nodes_count   = 1

# VPC
vpc_ip_range = "192.168.10.0/24"

# LOADBALANCER
loadbalancer_entry_port      = 22
loadbalancer_entry_protocol  = "tcp"
loadbalancer_target_port     = 2222
loadbalancer_target_protocol = "tcp"

# IMAGEPULL_SECRET
imagepull_secret_key       = ".dockerconfigjson"
imagepull_secret_name      = "do-registry"
imagepull_secret_namespace = "workshop"
imagepull_secret_type      = "kubernetes.io/dockerconfigjson"

# NAMESPACES
namespaces = [
  "poc",
  "nginx",
  "certmanager"
]

# NGINX
nginx_release_name = "nginx-ingress"

# CERTMANAGER
cert_manager_release_name = "cert-manager"
cert_manager_email        = "workshop@hello-world.org"
cert_manager_cluster_issuers = {
  prod = {
    name   = "letsencrypt-prod"
    server = "https://acme-v02.api.letsencrypt.org/directory"
  }
}

# OVH DOMAIN RECORD
ovh_domain_record_subdomain = "workshop"
ovh_domain_record_ttl       = "1800"
ovh_domain_record_type      = "A"

# DO DOMAIN
do_dns_record = {
  "app" = {
    name = "workshop"
    type = "A"
  }
  "www" = {
    name = "www.workshop"
    type = "A"
  }
  "workaround" = {
    name = "workaround"
    type = "A"
  }
}