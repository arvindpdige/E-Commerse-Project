

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg"
  location = var.location
  
}

module "virtual_network" {
  source = "./modules/vnet"
  prefix = var.prefix
  depends_on = [ azurerm_resource_group.rg ]
  vnet_address_space = [var.vnet_address_space[0], var.vnet_address_space[1]]
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
}

module "virtual_machine" {
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  vm_size = var.vm_size
  prefix = var.prefix
  source = "./modules/vm"
  user = var.user
  password = var.password
  vm_sku = var.vm_sku
  subnet_id = module.virtual_network.subnet_id
  public_ip_id = module.virtual_network.public_ip_id
  depends_on = [ azurerm_resource_group.rg, module.virtual_network ]
}
