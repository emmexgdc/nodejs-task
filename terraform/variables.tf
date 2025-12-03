variable "do_token" {
  description = "DigitalOcean API Token"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "DigitalOcean region for resources"
  type        = string
  default     = "nyc3"
}

variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
  default     = "nodejs-task-cluster"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "nodejs-task-vpc"
}

variable "registry_name" {
  description = "Name of the container registry"
  type        = string
  default     = "emmexnodejs"
  
  validation {
    condition     = can(regex("^[a-z0-9]+$", var.registry_name))
    error_message = "Registry name must be lowercase alphanumeric only."
  }
}

variable "k8s_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.34.1-do.0"
}

variable "node_size" {
  description = "Size of worker nodes"
  type        = string
  default     = "s-2vcpu-2gb"
}

variable "node_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 2
  
  validation {
    condition     = var.node_count >= 1 && var.node_count <= 10
    error_message = "Node count must be between 1 and 10."
  }
}