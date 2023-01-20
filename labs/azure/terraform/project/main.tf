
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

  environment   = var.environment
  location      = var.location
  workload      = "lab"
  instance      = "001"
  address_space = ["10.0.0.0/16"]
}
