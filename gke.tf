module "gke" {
  source = "terraform-google-modules/kubernetes-engine/google"
  project_id = var.GCP_project
  name       = "ollama-cluster"
  region     = var.region
  zones      = var.zones
  network    = var.network

  node_pools = [
    {
      name               = "default-pool"
      machine_type       = "e2-medium"
      min_count          = 1
      max_count          = 2
      initial_node_count = 1
    },
  ]
}

resource "google_container_cluster" "primary" {
  name               = "ollama-cluster"
  location           = var.region
  initial_node_count = 1
}

resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.primary.name
  location   = google_container_cluster.primary.location
  node_count = 1

  node_config {
    machine_type = "e2-medium"
  }
}
