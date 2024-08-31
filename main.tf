terraform {
  required_version = ">= 1.0.0"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "gke" {
  source            = "./gke"
  cluster_name      = var.cluster_name
  region            = var.region
  node_count        = var.node_count
  machine_type      = var.machine_type
}

module "flux" {
  source            = "./flux"
  cluster_name      = module.gke.cluster_name
  region            = var.region
}

module "helm" {
  source            = "./helm"
  cluster_name      = module.gke.cluster_name
  namespace         = var.namespace
  chart_name        = var.chart_name
  chart_version     = var.chart_version
  repository        = var.repository
  values            = var.values
}

module "openwebui" {
  source             = "./helm"
  cluster_name       = module.gke.cluster_name
  namespace          = var.namespace
  chart_name         = var.openwebui_chart_name
  chart_version      = var.openwebui_chart_version
  repository         = var.openwebui_repository
  values             = var.openwebui_values
}
