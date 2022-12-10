terraform {
  # Providers block, terraform when initialized
  # will proceed to download every executable to communicate
  # with providers api.
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "~>0.24.0"
    }
  }
}

resource "ovh_domain_zone_record" "example" {
  fieldtype = var.type
  target    = var.target
  zone      = var.zone
  subdomain = var.subdomain
  ttl       = var.ttl
}