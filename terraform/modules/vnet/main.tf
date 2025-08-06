
resource "azurerm_virtual_network" "vnet" {
    name = "${var.prefix}-vnet"
    resource_group_name = var.resource_group_name
    address_space = [var.vnet_address_space[0]]
    location = var.location
}

resource "azurerm_subnet" "subnet" {
    name = "${var.prefix}-subnet"
    resource_group_name = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = [var.vnet_address_space[1]]
    
}

resource "azurerm_network_security_group" "nsg" {
    name = "${var.prefix}-nsg"
    location = var.location
    resource_group_name = var.resource_group_name
    dynamic "security_rule" {
        for_each = local.nsg_rules
        content {
            name =security_rule.value.description
            priority = security_rule.value.priority
            direction = "Inbound"
            access = "Allow"
            protocol = security_rule.value.protocol
            source_port_range = "*"
            source_address_prefix = "*" 
            destination_port_range = security_rule.value.destination_port_range
            destination_address_prefix = "*"
        } 
    }
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg" {
    subnet_id = azurerm_subnet.subnet.id
    network_security_group_id = azurerm_network_security_group.nsg.id
  
}

resource "azurerm_public_ip" "pub_ip" {
    name = "${var.prefix}-pub-ip"
    location = var.location
    resource_group_name = var.resource_group_name
    allocation_method = "Static"
    sku = "Standard"
  
}
