

resource "azurerm_public_ip" "pip" {
  name                = var.pip_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = "Static"


}