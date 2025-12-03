output "cluster_id" {
  description = "Kubernetes cluster ID"
  value       = digitalocean_kubernetes_cluster.main.id
}

output "cluster_name" {
  description = "Kubernetes cluster name"
  value       = digitalocean_kubernetes_cluster.main.name
}

output "cluster_endpoint" {
  description = "Kubernetes cluster endpoint"
  value       = digitalocean_kubernetes_cluster.main.endpoint
  sensitive   = true
}

output "vpc_id" {
  description = "VPC ID"
  value       = digitalocean_vpc.main.id
}

output "vpc_name" {
  description = "VPC name"
  value       = digitalocean_vpc.main.name
}

output "registry_endpoint" {
  description = "Container registry endpoint"
  value       = digitalocean_container_registry.main.endpoint
}

output "registry_name" {
  description = "Container registry name"
  value       = digitalocean_container_registry.main.name
}

output "firewall_id" {
  description = "Firewall ID"
  value       = digitalocean_firewall.k8s.id
}

output "kubeconfig_command" {
  description = "Command to get kubeconfig"
  value       = "doctl kubernetes cluster kubeconfig save ${digitalocean_kubernetes_cluster.main.name}"
}

