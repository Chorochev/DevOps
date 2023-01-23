////////////////////
// Resource group
////////////////////
resource "azurerm_resource_group" "this" {
  name     = "rg-${var.workload}-${var.environment}-${var.location}-${var.instance}"
  location = var.location
}

////////////////////
// Network watcher
////////////////////
resource "azurerm_network_watcher" "this" {
  name                = "netw-${var.workload}-${var.environment}-${var.location}-${var.instance}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  depends_on = [azurerm_resource_group.this]
}

////////////////////
// Virtual network
////////////////////
resource "azurerm_virtual_network" "this" {
  name                = "net-${var.workload}-${var.environment}-${var.location}-${var.instance}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = var.net_address_space
  
  depends_on = [azurerm_resource_group.this, azurerm_network_watcher.this]
}

////////////////////
// Subnet
////////////////////
resource "azurerm_subnet" "this" {
  count = var.subnet_count

  name                 = "subnet-${var.workload}-${var.environment}-${var.location}-00${count.index}"
  virtual_network_name = azurerm_virtual_network.this.name
  resource_group_name  = azurerm_resource_group.this.name
  address_prefixes     = ["${var.subnet_address_prefixes[count.index]}"]
  
  depends_on = [azurerm_virtual_network.this]
}
