terraform {
  required_providers {
    digitalocean = {
      source = ""
      version = ""
    }
  }

  backend "s3" {}

}

provider "digitalocean" {}

module "doks_cluster" {
  source = "../../modules/services/doks"
}