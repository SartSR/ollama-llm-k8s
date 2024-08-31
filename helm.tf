resource "helm_release" "ollama" {
  name       = var.chart_name
  repository = var.repository
  chart      = var.chart_name
  version    = var.chart_version
  namespace  = var.namespace
  values     = [file("${path.module}/values.yaml")]
}

resource "helm_release" "openwebui" {
  name       = var.openwebui_chart_name
  repository = var.openwebui_repository
  chart      = var.openwebui_chart_name
  version    = var.openwebui_chart_version
  namespace  = var.namespace
  values     = [file("${path.module}/openwebui-values.yaml")]
}
