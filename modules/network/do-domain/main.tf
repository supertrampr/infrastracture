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

# This resource block will create a domain in Digital Ocean project.
resource "digitalocean_domain" "example" {
  name = var.name
}