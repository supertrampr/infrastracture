variable "name" {
  description = "Name of the release to install."
  type        = string
}

variable "namespace" {
  description = "Namespace where the release resources will be deployed."
  type        = string
}

variable "load_balancer_id" {
  description = "ID of the loadbalancer to use as controller."
  type        = string
}

variable "load_balancer_name" {
  description = "Name of the loadbalancer to use as controller."
  type        = string
}

variable "load_balancer_public_ip" {
  description = "Public ip of the loadbalancer to use ad controller."
  type        = string
}