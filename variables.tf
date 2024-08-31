variable "GCP_project" {
  description = "The GCP project to deploy the infrastructure into."
  type        = string
}

variable "region" {
  description = "The GCP region to deploy the infrastructure into."
  type        = string
  default     = "us-central1"
}

variable "zones" {
  description = "The GCP zones to deploy the infrastructure into."
  type        = list(string)
  default     = ["us-central1-a", "us-central1-b", "us-central1-c"]
}

variable "network" {
  description = "The VPC network where the GKE cluster will be deployed."
  type        = string
  default     = "default"
}

variable "GITHUB_TOKEN" {
  description = "GitHub Token to authenticate and create the Flux config repository."
  type        = string
}

variable "github_owner" {
  description = "The owner of the GitHub repository where Flux will be bootstrapped."
  type        = string
}

variable "namespace" {
  description = "The Kubernetes namespace for deploying Ollama and OpenWebUI."
  type        = string
  default     = "ollama-openwebui"
}

variable "openwebui_api_token" {
  description = "The API token for accessing OpenWebUI."
  type        = string
}
