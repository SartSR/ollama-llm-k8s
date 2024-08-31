resource "helm_release" "flux" {
  name       = "flux"
  repository = "https://charts.fluxcd.io"
  chart      = "flux"
  namespace  = "flux-system"

  set {
    name  = "git.url"
    value = "git@github.com:<your-repo>/your-config-repo.git"
  }
}
