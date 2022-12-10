variable "doks_cluster_k8s_version" {
  description = "Version of kubernetes to use within the cluster."
  type        = string
}

variable "doks_cluster_nodes_count" {
  description = "Number of nodes in the nodepool."
  type        = number
}

variable "doks_cluster_nodepool_size" {
  description = "Hardware capacity of the nodepool."
  type        = string
}