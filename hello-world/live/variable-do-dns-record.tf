variable "do_dns_record" {
  description = "Map of object containing dns record information."
  type = map(object({
    name = string
    type = string
  }))
}