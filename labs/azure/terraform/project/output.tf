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
