////////////////////
// Resource group
////////////////////
resource "azurerm_resource_group" "main" {
  name     = "rg-${var.workload}-${var.environment}-${var.location}-${var.instance}"
  location = var.location
}

////////////////////
// Virtual network
////////////////////
resource "azurerm_virtual_network" "main" {
  name                = "net-${var.workload}-${var.environment}-${var.location}-${var.instance}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = var.address_space
  
  depends_on = [azurerm_resource_group.main]
}
