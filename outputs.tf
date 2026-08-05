output "vm_name" {
  description = "The name of the provisioned Virtual Machine"
  value       = proxmox_virtual_environment_vm.debian_vm.name
}

output "vm_ips" {
  description = "The IP addresses assigned to the Virtual Machine"
  value       = proxmox_virtual_environment_vm.debian_vm.ipv4_addresses
}