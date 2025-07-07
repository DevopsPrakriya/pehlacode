terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "4dbb4b1d-3932-4f5b-8099-2ee0794bb44a"
}
