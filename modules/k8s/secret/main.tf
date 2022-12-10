resource "kubernetes_secret" "example" {
  metadata {
    name      = var.name
    namespace = var.namespace
  }

  data = {
    "${var.key}" = var.value
  }

  type = var.type
}