# Connection details
variable "proxmox_endpoint" {
  type        = string
  description = "The API endpoint of your Proxmox server"
}

variable "proxmox_api_token" {
  type        = string
  description = "The API Token ID and Secret"
  sensitive   = true # This prevents Terraform from printing it in plain text to your console
}

# VM configuration details
variable "proxmox_node" {
  type        = string
  description = "The physical hostname of your Proxmox node"
}

variable "proxmox_disk_datastore" {
  type        = string
  description = "The datastore where virtual machine disks are stored"
}

variable "ssh_public_key" {
  type        = string
  description = "The public SSH key to inject into the VM"
}