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

resource "digitalocean_record" "example" {
  domain = var.domain_name
  name   = var.name
  type   = var.type
  value  = var.value
}