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

variable "proxmox_iso_datastore" {
  type        = string
  description = "The datastore where ISOs and Cloud Images are stored"
  default     = "local"
}

variable "ssh_public_key" {
  type        = string
  description = "The public SSH key to inject into the VM"
}

variable "proxmox_ssh_private_key" {
  type        = string
  description = "The private SSH key of the Proxmox host root user "
  sensitive   = true # Prevents Terraform from showing your raw private key in stdout/logs
}

variable "vm_cpu_cores" {
  description = "vCPU cores for the sandbox VM"
  type        = number
  default     = 4
}

variable "vm_memory_mb" {
  description = "Dedicated RAM (MB) for the sandbox VM"
  type        = number
  default     = 8192
}

variable "gpu_mapping_name" {
  description = "Proxmox PCI resource mapping name"
  type        = string
  default     = "mx450"
}

variable "gpu_mapping_comment" {
  type    = string
  default = "GeForce MX450 passthrough for devops-sandbox-vm"
}

variable "gpu_pci_id" {
  description = "PCI vendor:device (e.g. 10de:1f97)"
  type        = string
}

variable "gpu_subsystem_id" {
  description = "PCI subsystem vendor:device"
  type        = string
}

variable "gpu_pci_path" {
  description = "Full PCI path (e.g. 0000:01:00.0)"
  type        = string
}

variable "gpu_iommu_group" {
  type = number
}