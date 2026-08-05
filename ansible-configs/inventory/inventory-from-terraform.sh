#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
IP="$(terraform -chdir="${SCRIPT_DIR}/../../terraform-configs" output -raw vm_ip)"
VM_NAME="$(terraform -chdir="${SCRIPT_DIR}/../../terraform-configs" output -raw vm_name)"

if [[ "${1:-}" == "--list" ]]; then
  cat <<EOF
{
  "sandbox": {
    "hosts": ["${VM_NAME}"]
  },
  "_meta": {
    "hostvars": {
      "${VM_NAME}": {
        "ansible_host": "${IP}",
        "ansible_user": "debian",
        "ansible_ssh_private_key_file": "~/.ssh/id_ed25519"
      }
    }
  }
}
EOF
elif [[ "${1:-}" == "--host" ]]; then
  echo '{}'
else
  echo "Usage: $0 --list|--host <hostname>" >&2
  exit 1
fi