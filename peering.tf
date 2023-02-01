// UK South Hub prod to heritage-nle-int
module "uksouth_prod_heritage_nle_int" {
  count  = var.environment == "prod-int" && var.region == "uksouth" ? 1 : 0
  source = "./vnet_peering"

  peerings = {
    source = {
      name           = "HmctsHubProdToHeritageNLEint"
      vnet           = var.vnet_name
      resource_group = "${var.name}-hub-${var.environment}"
    }
    target = {
      name           = "HeritageNLEintToHmctsHubProd"
      vnet           = "vnet-nle-int-01"
      resource_group = "InternalSpoke-rg"
    }
  }

  providers = {
    azurerm.initiator = azurerm
    azurerm.target    = azurerm.heritage_nle_int
  }
}