data "azurerm_mssql_server" "namahsqlserver" {
  name                         = var.azurerm_mssql_server_name
  resource_group_name          = var.azurerm_resource_group_name
}

resource "azurerm_mssql_database" "namahsqldatabase" {
  name         = var.azurerm_mssql_database_name
  server_id    = data.azurerm_mssql_server.namahsqlserver.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"


}