# GLOBAL
region = "fra1"
env    = "poc"
owner  = "neosyn"
tags = [
  "deployedBy:terraform",
  "env:poc",
  "project:workshop",
  "owner:neosyn"
]

# DOKS
doks_cluster_k8s_version   = "1.24.4-do.0"
doks_cluster_nodepool_size = "s-1vcpu-1gb"
doks_cluster_nodes_count   = 1

# VPC
vpc_ip_range = "192.168.10.0/24"
