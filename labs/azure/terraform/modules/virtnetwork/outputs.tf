output "resource_group" {
  value       = azurerm_resource_group.this.name
  description = "The resource group"
}

output "network_watcher" {
  value       = azurerm_network_watcher.this.name
  description = "The network watcher"
}

output "virtual_network" {
  value       = azurerm_virtual_network.this.name
  description = "The virtual_network"
}
