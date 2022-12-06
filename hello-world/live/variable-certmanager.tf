variable "cert_manager_release_name" {
  description = "Release name for the helm chart to install."
  type        = string
}

variable "cert_manager_email" {
  description = "Email for certificate renewal notification."
  type        = string
}

variable "cert_manager_cluster_issuers" {
  description = "Map of object containing cluster issuers information."
  type = map(object({
    name   = string
    server = string
  }))
}