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

# This resource block will create an additional vpc
# to your digitalocean project workspace.
resource "digitalocean_vpc" "example" {
  name     = var.name
  region   = var.region
  ip_range = var.ip_range

  timeouts {
    delete = "30m"
  }
}