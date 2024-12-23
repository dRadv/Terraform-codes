terraform {
  required_version = ">= 1.0.0 "
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "= 4.14.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id = "3fd5cc21-4a17-493b-aead-d0dadba3fa00"
}
