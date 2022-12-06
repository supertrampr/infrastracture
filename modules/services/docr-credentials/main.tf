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

# This resource will retrieve credentials for connecting to the container registry
resource "digitalocean_container_registry_docker_credentials" "example" {
  registry_name = var.registry_name
}