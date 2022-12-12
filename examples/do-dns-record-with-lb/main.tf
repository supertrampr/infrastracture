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

module "do_dns_record" {
  source = "../../modules/network/do-dns-record"

  domain_name = module.do_domain.name
  name        = "record1"
  type        = "A"
  value       = module.dolb.ip
}

module "do_domain" {
  source = "../../modules/network/do-domain"

  name = "do-domain-terraform-module.com"
}

module "dolb" {
  source = "../../modules/network/load-balancer"

  entry_port      = 22
  entry_protocol  = "tcp"
  name            = "dolb-example"
  region          = "fra1"
  target_port     = 2222
  target_protocol = "tcp"
  vpc_id          = module.vpc.id
}

module "vpc" {
  source = "../../modules/network/vpc"

  ip_range = "192.168.200.0/24"
  name     = "vpc-example"
  region   = "fra1"
}

