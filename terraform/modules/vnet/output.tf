
output "vnet_id" {
  description = "The ID of the virtual network."
  value       = azurerm_virtual_network.vnet.id
  
}

output "vnet_address_space" {
  description = "The address space of the virtual network."
  value       = azurerm_virtual_network.vnet.address_space  
}

output "subnet_id" {
  description = "The ID of the subnet."
  value       = azurerm_subnet.subnet.id
  
}

output "subnet_address_prefixes" {
  description = "The address prefixes of the subnet."
  value       = azurerm_subnet.subnet.address_prefixes
}

output "public_ip_id" {
  description = "The ID of the public IP address."
  value       = azurerm_public_ip.pub_ip.id
  
}


output "public_ip" {
  description = "The ID of the public IP."
  value       = azurerm_public_ip.pub_ip.ip_address
}

output "nsg_id" {
  description = "The ID of the network security group."
  value       = azurerm_network_security_group.nsg.id
}