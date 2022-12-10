variable "type" {
  description = "Type of DNS record to create."
  type        = string
}

variable "target" {
  description = "To what target the dns record will point."
  type        = string
}

variable "zone" {
  description = "DNS zone where to create the record."
  type        = string
}

variable "subdomain" {
  description = "Value of the dns record."
  type        = string
}

variable "ttl" {
  description = "Time to Live of the dns record."
  type        = string
}