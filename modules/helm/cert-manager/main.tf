resource "helm_release" "example" {
  chart            = "cert-manager"
  name             = var.name
  repository       = "https://charts.jetstack.io"
  version          = "1.10.1"
  namespace        = var.namespace
  create_namespace = true

  values = [
    file("${path.module}/values/certmanager.yaml")
  ]
}

resource "helm_release" "issuer" {
  for_each = var.cluster_issuers

  chart            = "${path.module}/charts/cluster-issuer"
  name             = each.value["name"]
  namespace        = var.namespace
  create_namespace = true

  values = [
    templatefile("${path.module}/values/issuer.yaml", {
      name       = each.value["name"]
      namespace  = var.namespace
      server_url = each.value["server"]
      email      = var.email
    })
  ]

  depends_on = [
    helm_release.example
  ]
}