resource "helm_release" "ollama" {
  name       = var.chart_name
  repository = var.repository
  chart      = var.chart_name
  version    = var.chart_version
  namespace  = var.namespace
  values     = [file("${path.module}/ollama-values.yaml")]
}

resource "helm_release" "openwebui" {
  name       = var.openwebui_chart_name
  repository = var.openwebui_repository
  chart      = var.openwebui_chart_name
  version    = var.openwebui_chart_version
  namespace  = var.namespace
  values     = [file("${path.module}/openwebui-values.yaml")]
}

resource "kubernetes_service" "openwebui" {
  metadata {
    name      = "openwebui-service"
    namespace = var.namespace
  }

  spec {
    selector = {
      "app.kubernetes.io/name" = "openwebui"
    }

    type = "LoadBalancer"  # This allows external access

    port {
      port        = 80
      target_port = 8080
    }
  }
}
