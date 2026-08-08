resource "proxmox_hardware_mapping_pci" "mx450" {
  name    = var.gpu_mapping_name
  comment = var.gpu_mapping_comment

  map = [
    {
      id           = var.gpu_pci_id
      iommu_group  = var.gpu_iommu_group
      node         = var.proxmox_node
      path         = var.gpu_pci_path
      subsystem_id = var.gpu_subsystem_id
    },
  ]
}