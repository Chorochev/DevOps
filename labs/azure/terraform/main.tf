
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "main" {
  name     = var.qa_resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "main" {
  name                = var.qa_virtual_network_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]

  depends_on = [azurerm_resource_group.main]
}

resource "azurerm_network_watcher" "main" {
  name                = var.qa_network_watcher_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  depends_on = [azurerm_resource_group.main]
}
