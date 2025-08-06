variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

###


variable "vnet_address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
  default = [ "10.3.0.0/16", "10.3.1.0/24"]
  
}

locals {
  nsg_rules = {
    allow_http = {
      priority               = 100
      destination_port_range = "80"
      description            = "Allow HTTP"
      protocol = "Tcp"
    }
    allow_https = {
      priority               = 110
      destination_port_range = "443"
      description            = "Allow HTTPS"
      protocol = "Tcp"
    }
    allow_ssh = {
      priority               = 120
      destination_port_range = "22"
      description            = "Allow SSH"
      protocol = "Tcp"
    }
    allow_rdp = {
      priority               = 130
      destination_port_range = "3389"
      description            = "Allow RDP"
      protocol = "Tcp"
    }
  }
}

###


variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string 
}

variable "user" {
  description = "Admin username for the virtual machine"
  type        = string
  sensitive = true
}

variable "password" {
  description = "Admin password for the virtual machine"
  type        = string
  sensitive = true
}

variable "vm_sku" {
  description = "value for the VM SKU"
  type        = string 
}