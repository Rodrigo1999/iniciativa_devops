terraform {
  required_version = "1.2.2"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "token" {}

provider "digitalocean" {
  token = var.token
}

resource "digitalocean_kubernetes_cluster" "devops_aula_3" {
  name   = "web-devops"
  region = "nyc1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.22.8-do.1"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 3
  }
}


provider "kubernetes" {
  host  = data.digitalocean_kubernetes_cluster.devops_aula_3.endpoint
  token = data.digitalocean_kubernetes_cluster.devops_aula_3.kube_config[0].token
}