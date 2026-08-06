terraform {
  required_version = "1.15.8"
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.111.1"
    }
  }
  cloud {
  organization = "the-real-server"
  workspaces {
    name = "code-server-sandbox"
  }
}
}

provider "proxmox" {
  endpoint = var.proxmox_endpoint
  api_token = var.proxmox_api_token
  insecure = true

  ssh {
    agent    = false
    username = "root"
    private_key = var.proxmox_ssh_private_key
  }
}