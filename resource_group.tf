resource "azurerm_resource_group" "terraform_rg" {
  location = "East US"
  name     = "terraform_rg"
}

# resource "random_string" "random_string" {
#   length  = 16
#   special = false
#   upper   = false
# }
#
# resource "azurerm_storage_account" "terraform_storage" {
#   account_replication_type = "LRS"
#   account_tier             = "Standard"
#   location                 = azurerm_resource_group.terraform_rg.location
#   name                     = "tfsa${random_string.random_string.id}"
#   resource_group_name      = azurerm_resource_group.terraform_rg.name
# }