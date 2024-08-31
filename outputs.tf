output "cluster_name" {
  description = "GKE cluster name"
  value       = module.gke.cluster_name
}

output "helm_release_name" {
  description = "Helm release name for Ollama LLM"
  value       = module.helm.release_name
}
output "openwebui_external_ip" {
  description = "The external IP address of the OpenWebUI service"
  value       = kubernetes_service.openwebui.status.load_balancer.ingress[0].ip
}
