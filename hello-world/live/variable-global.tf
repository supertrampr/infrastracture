variable "do_token" {
  description = "DigitalOcean access token."
}

variable "region" {
  description = "Region where the resources will be deployed."
  type        = string
}

variable "env" {
  description = "Environment of destination of resources."
  type        = string
}

variable "owner" {
  description = "Owner of the resources."
  type        = string
}

variable "tags" {
  description = "Map of tags to attach to resources."
  type        = set(string)
}

variable "domain_name" {
  description = "Domain name for the application."
  type        = string
}