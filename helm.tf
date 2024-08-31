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
  EOF
  ]
}

# Deploy Ollama using recommended YAML manifests in the same namespace
resource "kubernetes_manifest" "ollama" {
  manifest = file("${path.module}/manifests/ollama.yaml")
  namespace = kubernetes_namespace.ollama_openwebui.metadata[0].name
}
