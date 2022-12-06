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

resource "digitalocean_loadbalancer" "example" {
  name   = var.name
  region = var.region
  vpc_uuid = var.vpc_id

  forwarding_rule {
    entry_port      = var.entry_port
    entry_protocol  = var.entry_protocol
    target_port     = var.target_port
    target_protocol = var.target_protocol
  }

  lifecycle {
    ignore_changes = [
      forwarding_rule,
      enable_proxy_protocol
    ]
  }
}