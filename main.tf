terraform {

  backend "azurerm" {
    storage_account_name = "terrastate123"
    container_name       = "state-container"
    key                  = "terraform.tfstate"
    resource_group_name = "azureapp-auto-alerts-f8d316-ghada_chihi_devappland_com"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}


}

resource "azurerm_resource_group" "example" {
  name     = "${terraform.workspace}-rg"
  location = var.location
  tags = { environment = terraform.workspace
  }
}