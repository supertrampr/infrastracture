variable "name" {
  description = "Release name for the helm chart to install."
  type        = string
}

variable "namespace" {
  description = "Namespace where the resources will be deployed."
  type        = string
}

variable "email" {
  description = "Email for certificate renewal notification."
  type        = string
}

variable "cluster_issuers" {
  description = "Map of object containing cluster issuers information."
  type = map(object({
    name   = string
    server = string
  }))
}