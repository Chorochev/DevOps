output "resource_group" {
  value       = module.virtual_network.resource_group
  description = "The resource group"
}

output "network_watcher" {
  value       = module.virtual_network.network_watcher
  description = "The network watcher"
}

output "virtual_network" {
  value       = module.virtual_network.virtual_network
  description = "The virtual_network"
}

output "subnets" {
  value       = module.virtual_network.subnets[*]
  description = "The subnets"
}

output "public_ip" {
  value       = module.virtual_network.public_ip
  description = "The public ip"
}

output "network_interfaces" {
  value       = module.virtual_network.network_interfaces[*]
  description = "The network interfaces"
}

output "virtual_machines" {
  value       = module.virtual_network.virtual_machines[*]
  description = "The linux virtual machines"
}

output "network_security_group" {
  value       = module.virtual_network.network_security_group
  description = "The network security group."
}

output "association" {
  value       = module.virtual_network.association
  description = "The associates a network interface with a security_group."
}

