terraform {}
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}


provider "azurerm" {
  subscription_id = ""
  features {}
  alias = "vnet-dst-rg"
}
