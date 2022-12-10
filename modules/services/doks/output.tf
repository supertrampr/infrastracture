output "host" {
  value = digitalocean_kubernetes_cluster.example.kube_config.0.host
}

output "token" {
  value = digitalocean_kubernetes_cluster.example.kube_config.0.token
}

output "cluster_ca_certificate" {
  value     = digitalocean_kubernetes_cluster.example.kube_config.0.cluster_ca_certificate
  sensitive = true
}

output "id" {
  value = digitalocean_kubernetes_cluster.example.id
}