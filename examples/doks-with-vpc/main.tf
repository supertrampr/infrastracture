terraform {
  # Providers block, terraform when initialized
  # will proceed to download every executable to communicate
  # with providers api.
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~>2.0"
    }
  }
}

# Additional properties scoped to the single provider.
provider "digitalocean" {
  token = var.do_token
}

module "doks" {
  source = "../../modules/services/doks"

  k8s_version   = "1.25.4-do.0"
  name          = "doks-example"
  nodepool_name = "nodepool-example"
  nodepool_size = "s-2vcpu-4gb"
  nodes_count   = 1
  region        = "fra1"
  tags          = [
    "scope:example"
  ]
  vpc_id        = module.vpc.id
}

module "vpc" {
  source = "../../modules/network/vpc"

  ip_range = "192.168.200.0/24"
  name     = "vpc-example"
  region   = "fra1"
}

