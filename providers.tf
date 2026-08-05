terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.111.1"
    }
  }
}

provider "proxmox" {
  # The provider will automatically read:
  # - PROXMOX_VE_ENDPOINT
  # - PROXMOX_VE_API_TOKEN
  # - PROXMOX_VE_INSECURE
  # from your shell environment variables.
}