terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0"

    }
  }
}

provider "azurerm" {
  resource_provider_registrations = "none"
  features {}
  subscription_id = "3fd5cc21-4a17-493b-aead-d0dadba3fa00"
}

resource "azurerm_resource_group" "terraform_rg" {
  location = "eastus"
  name = "terraform_rg"
}