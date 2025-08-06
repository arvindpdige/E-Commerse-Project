

resource "azurerm_network_interface" "nic" {
    name                = "${var.prefix}-nic"
    location            = var.location
    resource_group_name = var.resource_group_name

    ip_configuration {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
        subnet_id = var.subnet_id
        public_ip_address_id = var.public_ip_id
    }
  
}


resource "azurerm_windows_virtual_machine" "vm" {
    name = "${var.prefix}-vm-win"
    resource_group_name = var.resource_group_name
    location = var.location
    size = var.vm_size
    admin_username = var.user
    admin_password = var.password
    network_interface_ids = [azurerm_network_interface.nic.id]
    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
        name = "${var.prefix}-osdisk"
    }
    source_image_reference {
        offer = "WindowsServer"
        publisher = "MicrosoftWindowsServer"
        sku = var.vm_sku
        version = "latest"
    }
    custom_data = filebase64("script.ps1")
}