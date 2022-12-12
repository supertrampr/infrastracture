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

module "vpc" {
  source = "../../modules/network/vpc"

  ip_range = "192.168.200.0/24"
  name     = "vpc-example"
  region   = "fra1"
}