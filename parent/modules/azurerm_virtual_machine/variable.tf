variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  
}
variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
}
variable "namahnic_name" {
    description = "The name of the network interface."
    type        = string
  
}

variable "subnet_name" {
    description = "The name of the subnet."
    type        = string
  
}
variable "virtual_network_name" {
    description = "The name of the virtual network."
    type        = string
  
}
variable "pip_name" {
    description = "The name of the public IP address."
    type        = string
  
}
variable "azurerm_virtual_machine_name" {
  
}
variable "vmusername" {
  
}
variable "vmpassword" {
  
}

variable "key_vault_name" {
  
}