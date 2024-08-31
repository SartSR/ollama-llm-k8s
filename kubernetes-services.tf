resource "kubernetes_service" "openwebui" {
  metadata {
    name      = "openwebui-service"
    namespace = kubernetes_namespace.ollama_openwebui.metadata[0].name
  }

  spec {
    selector = {
      app = "openwebui"
    }

    type = "LoadBalancer"

    port {
      port        = 80
      target_port = 8080
    }
  }
}

resource "kubernetes_service" "ollama" {
  metadata {
    name      = "ollama-service"
    namespace = kubernetes_namespace.ollama_openwebui.metadata[0].name
  }

  spec {
    selector = {
      app = "ollama"
    }

    type = "ClusterIP"

    port {
      port        = 11434
      target_port = 11434
    }
  }
}
