variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1-c"
}

variable "cluster_name" {
  description = "GKE cluster name"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the GKE cluster"
  type        = number
  default     = 1
}

variable "machine_type" {
  description = "GCP machine type for the nodes"
  type        = string
  default     = "n1-standard-1"
}

variable "namespace" {
  description = "Kubernetes namespace for Ollama deployment"
  type        = string
  default     = "ollama"
}

variable "chart_name" {
  description = "Helm chart name for Ollama LLM"
  type        = string
  default     = "ollama-llm"
}

variable "chart_version" {
  description = "Helm chart version"
  type        = string
  default     = "1.0.0"
}

variable "repository" {
  description = "Helm repository URL"
  type        = string
}

variable "values" {
  description = "Helm chart values"
  type        = map(string)
  default     = {}
}

variable "openwebui_chart_name" {
  description = "Helm chart name for OpenWebUI"
  type        = string
  default     = "openwebui"
}

variable "openwebui_chart_version" {
  description = "Helm chart version"
  type        = string
  default     = "1.0.0"
}

variable "openwebui_repository" {
  description = "Helm repository URL for OpenWebUI"
  type        = string
  default     = "https://helm.openwebui.com"
}

variable "openwebui_values" {
  description = "Helm chart values for OpenWebUI"
  type        = map(string)
  default     = {}
}
