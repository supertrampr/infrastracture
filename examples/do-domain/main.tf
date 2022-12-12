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

module "do_domain" {
  source = "../../modules/network/do-domain"

  name = "do-domain-terraform-module.com"
}

