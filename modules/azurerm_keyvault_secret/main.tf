resource "azurerm_key_vault_secret" "vmusername" {
  name         = var.vmusername
  value        = var.vmusernamevalue
  key_vault_id = data.azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "vmpassword" {
  name         = var.vmpassword
  value        = var.vmpasswordvalue
  key_vault_id = data.azurerm_key_vault.kv.id
}
data  "azurerm_key_vault" "kv" {
  name                        = var.key_vault_name
  resource_group_name         = var.resource_group_name
}