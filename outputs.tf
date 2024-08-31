output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "kubernetes_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "helm_release_status" {
  value = helm_release.openwebui.status
}

output "openwebui_ip_address" {
  value = kubernetes_service.openwebui.status[0].load_balancer[0].ingress[0].ip
}
