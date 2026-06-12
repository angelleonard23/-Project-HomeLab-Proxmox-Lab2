# Terraform Proxmox Homelab

Infrastructure as Code for Proxmox VE homelab using the [bpg/proxmox](https://registry.terraform.io/providers/bpg/proxmox/latest) provider.

## Prerequisites

- Terraform v1.10.5+
- Proxmox VE with API Token
- Debian 12 Cloud Template (VM ID 900)

## Setup

1. Create `terraform.tfvars` (excluded from repo via `.gitignore`):

```hcl
proxmox_url       = "https://<PROXMOX-IP>:8006"
proxmox_api_token = "root@pam!terraform=<TOKEN-SECRET>"
vm_password       = "<VM-PASSWORD>"
ssh_public_key    = "<SSH-PUBLIC-KEY>"
```

2. Initialize and deploy:

```bash
terraform init
terraform plan
terraform apply
```

## Stack

- **Provider:** bpg/proxmox ~> 0.73
- **Node:** angelix (Proxmox VE)
- **Template:** VM 900 — Debian 12 Genericcloud with Cloud-Init
- **Bridge:** vmbr1 (VLAN-aware)

## Security Notes

- Never commit `terraform.tfvars` to version control
- API Token uses `root@pam!terraform` with Privilege Separation disabled
- Secrets management via HashiCorp Vault planned (Q2 roadmap)
