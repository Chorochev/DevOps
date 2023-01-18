output "resource_group" {
  value = azurerm_resource_group.main.name
}

output "virtual_network" {
  value = azurerm_virtual_network.main.name
}