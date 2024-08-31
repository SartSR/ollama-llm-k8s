resource "helm_release" "flux" {
  name       = "flux"
  repository = "https://charts.fluxcd.io"
  chart      = "flux"
  namespace  = "flux-system"

  set {
    name  = "git.url"
    value = "git@github.com:sartsr/flux-ollama.git"
  }
  set {
    name  = "git.branch"
    value = "main"
  }

  set {
    name  = "git.secretName"
    value = kubernetes_secret.flux_github_token.metadata[0].name
  }

  set {
    name  = "sync.interval"
    value = "1m"
  }
}
