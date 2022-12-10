variable "name" {
  description = "Name of the vpc."
  type        = string
}

variable "region" {
  description = "Region where this vpc will be deployed."
  type        = string
}

variable "ip_range" {
  description = "IP range in cidr notation to use for this vpc."
  type        = string
}