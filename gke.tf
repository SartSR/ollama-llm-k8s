resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  initial_node_count = var.node_count

  node_config {
    machine_type = var.machine_type
  }
}

resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
  }
}
