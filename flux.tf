provider "github" {
  token = var.GITHUB_TOKEN
  owner = var.github_owner
}

resource "github_repository" "flux_ollama_repo" {
  name        = "flux-ollama"
  description = "Flux configuration for the Ollama and OpenWebUI deployment"
  private     = true  # Set to false if you want the repository to be public
  visibility  = "private"

  # Other optional configurations
  auto_init           = true
  gitignore_template  = "Terraform"
  default_branch      = "main"
}

resource "kubernetes_namespace" "ollama_openwebui" {
  metadata {
    name = var.namespace
  }
}

resource "flux_bootstrap_github" "flux" {
  token        = var.GITHUB_TOKEN
  owner        = var.github_owner
  repository   = github_repository.flux_ollama_repo.name  # Use the repository created by Terraform
  path         = "./clusters/${google_container_cluster.primary.name}"
  branch       = "main"
  personal     = true
  hostname     = "github.com"
  kubernetes   = {
    context = "gke_${var.GCP_project}_${var.region}_${google_container_cluster.primary.name}"
  }
}
