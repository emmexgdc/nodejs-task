resource "digitalocean_vpc" "main" {
  name     = var.vpc_name
  region   = var.region
  ip_range = "10.10.0.0/16"
}

resource "digitalocean_kubernetes_cluster" "main" {
  name    = var.cluster_name
  region  = var.region
  version = var.k8s_version

  vpc_uuid = digitalocean_vpc.main.id

  node_pool {
    name       = "worker-pool"
    size       = var.node_size
    node_count = var.node_count
  }

  tags = ["task-api", "devops-interview"]
}

resource "digitalocean_container_registry" "main" {
  name                   = var.registry_name
  subscription_tier_slug = "basic"
  region                 = "nyc3"
}

resource "digitalocean_firewall" "k8s" {
  name = "${var.cluster_name}-firewall"

  droplet_ids = []

  # Allow inbound HTTPS (for LoadBalancer)
  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  # Allow inbound HTTP (for LoadBalancer)
  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  # Allow all outbound traffic
  outbound_rule {
    protocol              = "tcp"
    port_range            = "all"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "all"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

# Connect cluster to registry
resource "digitalocean_container_registry_docker_credentials" "main" {
  registry_name = digitalocean_container_registry.main.name
}