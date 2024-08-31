resource "kubernetes_namespace" "ollama_openwebui" {
  metadata {
    name = var.namespace
  }
}

resource "flux_bootstrap_github" "flux" {
  token        = var.GITHUB_TOKEN
  owner        = var.github_owner
  repository   = "flux-ollama"
  path         = "./clusters/${google_container_cluster.primary.name}"
  branch       = "main"
  personal     = true
  hostname     = "github.com"
  kubernetes   = {
    context = "gke_${var.GCP_project}_${var.region}_${google_container_cluster.primary.name}"
  }
}
