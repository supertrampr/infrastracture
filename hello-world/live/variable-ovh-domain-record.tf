variable "ovh_domain_record_type" {
  description = "Type of DNS record to create."
  type        = string
}

variable "ovh_domain_record_subdomain" {
  description = "Value of the dns record."
  type        = string
}

variable "ovh_domain_record_ttl" {
  description = "Time to Live of the dns record."
  type        = string
}