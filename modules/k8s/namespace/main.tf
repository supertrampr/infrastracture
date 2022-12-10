resource "kubernetes_namespace" "example" {
  metadata {
    name = var.name
  }
}