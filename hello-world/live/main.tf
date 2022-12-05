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

module "doks_cluster" {
  source = "../../modules/services/doks"

  k8s_version   = var.doks_cluster_k8s_version
  name          = "doks-${var.region}-${var.env}-${var.owner}"
  nodepool_name = "nodes-${var.region}-${var.env}-${var.owner}"
  nodepool_size = var.doks_cluster_nodepool_size
  region        = var.region
  nodes_count   = var.doks_cluster_nodes_count

  tags = var.tags

}