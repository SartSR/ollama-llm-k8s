terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }
    flux = {
      source  = "weaveworks/flux"
      version = ">= 0.1.0"
    }
  }

  required_version = ">= 1.0.0"
}

provider "google" {
  project = var.GCP_project
  region  = var.region
}

provider "kubernetes" {
  host  = google_container_cluster.primary.endpoint
  token = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
}
