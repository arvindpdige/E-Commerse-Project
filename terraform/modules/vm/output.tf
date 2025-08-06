
output "vm_private_ip" {
  value = azurerm_network_interface.nic.private_ip_address
}
output "vm_name" {
  value = azurerm_windows_virtual_machine.vm.name
}