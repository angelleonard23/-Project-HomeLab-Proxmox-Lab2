resource "proxmox_virtual_environment_vm" "storage-01" {
  node_name = "angelix"
  vm_id     = 109
  name      = "storage-01"

  clone {
    vm_id = 900
    full  = true
  }

  cpu {
    cores = 2
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 4096
  }

  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = 32
  }

  network_device {
    bridge  = "vmbr1"
    vlan_id = 60
  }

  initialization {
    ip_config {
      ipv4 {
        address = "10.0.60.10/24"
        gateway = "10.0.60.1"
      }
    }
    user_account {
      username = "angel"
      password = var.vm_password
      keys     = [var.ssh_public_key]
    }
  }

  operating_system {
    type = "l26"
  }
}
