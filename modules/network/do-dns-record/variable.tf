variable "domain_name" {
  description = "Name of the domain where to create the record."
  type        = string
}

variable "name" {
  description = "Name of the record."
  type        = string
}

variable "type" {
  description = "Type of dns record"
  type        = string
}

variable "value" {
  description = "Value where the dns record points."
  type        = string
}