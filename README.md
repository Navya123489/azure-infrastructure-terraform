# Azure Infrastructure — Terraform

Terraform configuration for provisioning a secure Azure 
network foundation, structured to enterprise standards.

## What this builds

- Resource Group — tagged and environment-aware
- Virtual Network — 10.0.0.0/16 address space, UK South region
- Subnet — 10.0.1.0/24
- Network Security Group — with SSH inbound rule
- NSG Association — NSG linked to subnet

## File structure

| File | Purpose |
|---|---|
| main.tf | All Azure resources |
| variables.tf | Input variables (environment, location) |
| outputs.tf | Output values (IDs and names) |

## Usage

```bash
terraform init
terraform validate
terraform plan
```

## Requirements

- Terraform >= 1.3.0
- Azure subscription (for apply)
- AzureRM provider ~> 3.0

## Author
Navya Kanchisamudram — Azure Administrator (AZ-104)
Navya Kanchisamudram — Azure Administrator (AZ-104)# azure-infrastructure-terraform
Terraform modules for Azure infrastructure -  VNets, NSGs, compute and storage
