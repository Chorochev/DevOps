
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
  tenant_id       = var.tenant_id
}

module "virtual_network" {
  source = "../modules/virtnetwork"

  environment             = var.environment
  location                = var.location
  workload                = var.workload
  instance                = var.instance
  net_address_space       = var.net_address_space
  subnet_count            = var.subnet_count
  subnet_types            = var.subnet_types
  subnet_address_prefixes = var.subnet_address_prefixes
}
