resource "azurerm_virtual_network" "terraform_vnet" {
  name                = "terraform_vnet"
  location            = azurerm_resource_group.terraform_rg.location
  resource_group_name = azurerm_resource_group.terraform_rg.name
  address_space       = ["10.0.0.0/16"]
  tags = {
    "Environment" = "Dev"
    "tagche" = "testche"
  }
}


resource  "azurerm_subnet" "public" {
  name                  = "public"
  resource_group_name   = azurerm_resource_group.terraform_rg.name
  virtual_network_name  = azurerm_virtual_network.terraform_vnet.name
  address_prefixes      = ["10.0.0.0/17"]
}

resource "azurerm_public_ip" "terraform_ip" {
  name                = "terraform_ip"
  resource_group_name = azurerm_resource_group.terraform_rg.name
  location            = azurerm_resource_group.terraform_rg.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "terraform_nic" {
  name                = "terraform_nic"
  location            = azurerm_resource_group.terraform_rg.location
  resource_group_name = azurerm_resource_group.terraform_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.public.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.terraform_ip.id
  }
}