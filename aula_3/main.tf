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
  version = "1.23.9-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 3
  }
}

/* 
  Serve para mostrar algo no terminal após a criação das minhas configurações 
  
  https://www.terraform.io/language/values/outputs
*/
output "kube_endpoint" {
  value = digitalocean_kubernetes_cluster.devops_aula_3.endpoint
}

/* 
  Usado para criar arquivos locals, nesse caso estou pegando o kube_config da digital oceans.
  O kube_config file será usado pelo kubectl para se comunicar com a digital ocean

  local_file registry: https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
 */
resource "local_file" "kube_config" {
    content  = digitalocean_kubernetes_cluster.devops_aula_3.kube_config.0.raw_config
    filename = "kube_config.yaml"
}
provider "kubernetes" {
  host  = data.digitalocean_kubernetes_cluster.devops_aula_3.endpoint
  token = data.digitalocean_kubernetes_cluster.devops_aula_3.kube_config[0].token
}