output "message" {
  value = "Connect to the doks cluster by running: doctl kubernetes cluster kubeconfig save ${module.doks_cluster.id}"
}