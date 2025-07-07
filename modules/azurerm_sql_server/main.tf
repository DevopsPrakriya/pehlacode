

resource "azurerm_mssql_server" "namahsqlserver" {
  name                         = var.azurerm_mssql_server_name
  resource_group_name          = var.azurerm_resource_group_name
  location                     = var.azurerm_location
  version                      = var.namahsqlserver_version
  administrator_login          = var.azurerm_mssql_administrator_name
  administrator_login_password = var.azurerm_administrator_login_password
}