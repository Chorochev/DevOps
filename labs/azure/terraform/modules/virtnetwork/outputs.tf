output "resource_group" {
  value = azurerm_resource_group.this.name
}

output "virtual_network" {
  value = azurerm_virtual_network.this.name
}

output "network_watcher" {
  value = azurerm_network_watcher.this.name
}