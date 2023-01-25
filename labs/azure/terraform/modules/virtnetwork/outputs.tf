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
  description = "The virtual network"
}

output "subnets" {
  value       = azurerm_subnet.this[*].name
  description = "The subnets"
}

output "public_ip" {
  value       = azurerm_public_ip.this.ip_address
  description = "The public ip"
}

output "network_interfaces" {
  value       = azurerm_network_interface.this[*].name
  description = "The network interfaces"
}

output "virtual_machines" {
  value       = azurerm_linux_virtual_machine.this[*].name
  description = "The linux virtual machines"
}

output "network_security_group" {
  value       = azurerm_network_security_group.this.name
  description = "The network security group."
}

output "association" {
  value       = azurerm_network_interface_security_group_association.this.id
  description = "The associates a network interface with a security_group."
}
