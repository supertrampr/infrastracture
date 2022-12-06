resource "helm_release" "example" {
  chart            = "ingress-nginx"
  name             = var.name
  repository       = "https://kubernetes.github.io/ingress-nginx"
  version          = "4.3.0"
  namespace        = var.namespace
  create_namespace = true

  values = [
    templatefile("${path.module}/values/values.yaml", {
      load_balancer_id   = var.load_balancer_id
      load_balancer_name = var.load_balancer_name
      public_ip          = var.load_balancer_public_ip
    })
  ]
}