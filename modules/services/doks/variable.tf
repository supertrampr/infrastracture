variable "name" {
  description = "Name of the DOKS cluster."
  type        = string
}

variable "region" {
  description = "Region where this DOKS instance will be deployed."
  type        = string
}

variable "k8s_version" {
  description = "Version of kubernetes to use within the cluster."
  type        = string
}

variable "nodepool_name" {
  description = "Name of the nodepool."
  type        = string
}

variable "nodepool_size" {
  description = "Hardware capacity of the nodepool."
  type        = string
}

variable "nodes_count" {
  description = "Number of nodes in the nodepool."
  type        = number
}

variable "tags" {
  description = "List of tags to be attached to the DOKS cluster."
  type        = set(string)
}
