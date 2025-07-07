
resource "azurerm_network_interface" "namahnic" {
  name                = var.namahnic_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name


##isme subnet aur public ip ko connect karne ke liye
  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    public_ip_address_id          = data.azurerm_public_ip.pip.id
    private_ip_address_allocation = "Dynamic"
  }
}
data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
}
data "azurerm_public_ip" "pip" {
  name                = var.pip_name
  resource_group_name = var.resource_group_name

}


resource "azurerm_linux_virtual_machine" "namah" {
  name                = var.azurerm_virtual_machine_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = "Standard_F2"
  admin_username      = data.azurerm_key_vault_secret.namesecret.value
  admin_password      = data.azurerm_key_vault_secret.passwordsecret.value
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.namahnic.id,
  ]



  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  custom_data = base64encode(<<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y nginx
    sudo systemctl enable nginx
    sudo systemctl start nginx
    EOF
  )
}



data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "namesecret" {
  name                = var.vmusername
  key_vault_id        = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "passwordsecret" {
  name                = var.vmpassword
  key_vault_id        = data.azurerm_key_vault.kv.id
}

