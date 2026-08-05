# This resource downloads the official Debian 12 Cloud-Init image directly to Proxmox
resource "proxmox_download_file" "debian_cloud_image" {
  content_type = "iso"
  datastore_id = var.proxmox_iso_datastore
  node_name    = var.proxmox_node
  url          = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2"
  file_name    = "debian-12-generic-amd64.img"
}
