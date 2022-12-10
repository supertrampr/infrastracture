variable "loadbalancer_entry_port" {
  description = "The port that will be contacted."
  type        = number
}

variable "loadbalancer_entry_protocol" {
  description = "Protocol used when communicating with the entry port."
  type        = string
}

variable "loadbalancer_target_port" {
  description = "The port that where the traffic will be forwarded."
  type        = number
}

variable "loadbalancer_target_protocol" {
  description = "Protocol used when communicating with the target port."
  type        = string
}