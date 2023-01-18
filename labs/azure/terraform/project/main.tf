
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

module "qa_virtual_network" {
  source = "../modules/virtnetwork"

  environment   = "qa"
  location      = "eastasia"
  workload      = "lab"
  instance      = "001"
  address_space = ["10.0.0.0/16"]
}

module "prod_virtual_network" {
  source = "../modules/virtnetwork"

  environment   = "prod"
  location      = "southeastasia"
  workload      = "lab"
  instance      = "001"
  address_space = ["10.0.0.0/16"]
}
