// example of in subscription peering 
module "uksouth_prod_heritage_nle_int" {
  # count  = var.environment == "prod-int" && var.region == "uksouth" ? 1 : 0
  source = "github.com/hmcts/terraform-module-vnet-peering"

  peerings = {
    source = {
      name           = "srctodst"
      vnet           =  var.vnet_name
      resource_group = "main-rg"
    }
    target = {
      name           = "dsttosrc"
      vnet           = "vnet-dst"
      resource_group = "vnet-dst-rg"
    }
  }

  providers = {
    azurerm.initiator = azurerm
    azurerm.target    = azurerm.vnet-dst-rg
        # azurerm.target    = azurerm
  }
}
