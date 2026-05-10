output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.main.name
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.main.name
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.main.id
}

output "nsg_id" {
  description = "The ID of the network security group"
  value       = azurerm_network_security_group.main.id
}
output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.main.name
}