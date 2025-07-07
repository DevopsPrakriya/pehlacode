variable "key_vault_name" {
  description = "The name of the Key Vault to create."
  type        = string
  
}
variable "resource_group_name" {
  description = "The name of the resource group where the Key Vault will be created."
  type        = string
}
variable "vmusername" {
  description = "The name of the secret for the VM username."
  type        = string  
  
}
variable "vmusernamevalue" {
  description = "The value of the secret for the VM username."
  type        = string
}
variable "vmpassword" {
  description = "The name of the secret for the VM password."
  type        = string
  
}
variable "vmpasswordvalue" {
  description = "The value of the secret for the VM password."
  type        = string
}
