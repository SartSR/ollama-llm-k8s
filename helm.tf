resource "helm_repository" "openwebui" {
  name = "openwebui"
  url  = "https://open-webui.github.io/helm-charts/"
}

resource "helm_release" "openwebui" {
  name       = "openwebui"
  repository = helm_repository.openwebui.name
  chart      = "openwebui"
  namespace  = kubernetes_namespace.ollama_openwebui.metadata[0].name
  values = [
    <<EOF
  service:
    type: LoadBalancer
  persistence:
    enabled: true
    size: 5Gi
    storageClass: "standard"
  environment:
    OLLAMA_API_URL: "http://ollama-service:11434"  # Connect to Ollama on port 11434
    OPENWEBUI_API_TOKEN: "${var.openwebui_api_token}"  # API token for accessing OpenWebUI
  EOF
  ]
}
