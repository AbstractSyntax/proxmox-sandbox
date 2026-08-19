# 1. Download the Debian Cloud-Init Image
resource "proxmox_download_file" "debian_cloud_image" {
  content_type = "iso"
  datastore_id = var.proxmox_iso_datastore
  node_name    = var.proxmox_node
  url          = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2"
  file_name    = "debian-12-generic-amd64.img"
  overwrite    = false
}

# 2. Create the Custom Cloud-Init User-Data Snippet
resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
  content_type = "snippets"
  datastore_id = var.proxmox_iso_datastore
  node_name    = var.proxmox_node

  source_raw {
    file_name = "devops-sandbox-user-data.yaml"

    data = <<-EOF
    #cloud-config
    users:
      - name: debian
        groups: sudo
        sudo: ALL=(root) NOPASSWD:ALL
        shell: /bin/bash
        ssh_authorized_keys:
          - ${trimspace(var.ssh_public_key)}
    
    package_update: true
    package_upgrade: true
    
    packages:
      - qemu-guest-agent
    
    runcmd:
      - systemctl enable --now qemu-guest-agent
    EOF
  }
}

# 3. Create the Virtual Machine
resource "proxmox_virtual_environment_vm" "debian_vm" {
  name        = "devops-sandbox-vm"
  description = "Managed by Terraform"
  node_name   = var.proxmox_node
  machine     = "q35"

  agent {
    enabled = true
  }

  cpu {
    cores = var.vm_cpu_cores
    type = "host"
  }

  memory {
    dedicated = var.vm_memory_mb
  }

  disk {
    datastore_id = var.proxmox_disk_datastore
    file_id      = proxmox_download_file.debian_cloud_image.id
    interface    = "scsi0"
    size         = 60
  }

  initialization {
    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }

  network_device {
    bridge = "vmbr0"
  }

  hostpci {
    device  = "hostpci0"
    mapping = proxmox_hardware_mapping_pci.mx450.name
    pcie    = true
    xvga    = false
  }

  serial_device {}
}
