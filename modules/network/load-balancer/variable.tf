variable "name" {
  description = "Name of the loadbalancer."
  type        = string
}

variable "region" {
  description = "Region where the resource will be deployed."
  type        = string
}

variable "vpc_id" {
  description = "ID of the vpc where to deploy the resource."
  type        = string
}

variable "entry_port" {
  description = "The port that will be contacted."
  type        = number
}

variable "entry_protocol" {
  description = "Protocol used when communicating with the entry port."
  type        = string
}

variable "target_port" {
  description = "The port that where the traffic will be forwarded."
  type        = number
}

variable "target_protocol" {
  description = "Protocol used when communicating with the target port."
  type        = string
}