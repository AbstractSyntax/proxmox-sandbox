output "vm_name" {
  description = "The name of the provisioned Virtual Machine"
  value       = proxmox_virtual_environment_vm.debian_vm.name
}

output "vm_ip" {
  description = "The IP addresses assigned to the Virtual Machine"
  value       = [
    for ip in flatten(proxmox_virtual_environment_vm.debian_vm.ipv4_addresses) : ip
    if ip != "127.0.0.1"
  ][0]
}
