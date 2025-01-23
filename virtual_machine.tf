resource "azurerm_virtual_machine" "terraform_vm" {
  name                  = "${random_string.random_string.id}-vm2"
  location              = azurerm_resource_group.terraform_rg.location
  resource_group_name   = azurerm_resource_group.terraform_rg.name
  network_interface_ids = [azurerm_network_interface.terraform_nic.id]
  vm_size               = "Standard_B1s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "terraform-vm"
    admin_username = "terradmin"
    admin_password = "Pa$$w0rd"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "dev"
  }
}