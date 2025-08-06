variable "prefix" {}

variable "vnet_address_space" {
  type = list(string)
  }

locals {
  nsg_rules = {
    allow_http = {
      priority               = 100
      destination_port_range = "80"
      description            = "Allow_HTTP"
      protocol = "Tcp"
    }
    allow_https = {
      priority               = 110
      destination_port_range = "443"
      description            = "Allow_HTTPS"
      protocol = "Tcp"
    }
    allow_ssh = {
      priority               = 120
      destination_port_range = "22"
      description            = "Allow_SSH"
      protocol = "Tcp"
    }
    allow_rdp = {
      priority               = 130
      destination_port_range = "3389"
      description            = "Allow_RDP"
      protocol = "Tcp"
    }
  }
}

variable "resource_group_name" {}

variable "location" {}