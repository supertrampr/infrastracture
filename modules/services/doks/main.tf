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
}

# This resource block will create a simple DOKS cluster
# with an additional nodepool attached to it.
resource "digitalocean_kubernetes_cluster" "example" {
  name     = var.name
  region   = var.region
  version  = var.k8s_version
  vpc_uuid = var.vpc_id
  node_pool {
    name       = var.nodepool_name
    size       = var.nodepool_size
    node_count = var.nodes_count
  }

  tags = var.tags
}