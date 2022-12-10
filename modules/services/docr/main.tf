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

# This resource block creates a new digital ocean container registry
# with a starter plan subscription (free-tier)
resource "digitalocean_container_registry" "example" {
  name                   = var.name
  subscription_tier_slug = "starter"
  region                 = var.region
}