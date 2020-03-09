provider "azurerm" {
  version = "~>1.18"

  subscription_id = var.azure_subscription_id
  client_id       = var.azure_sp_client_id
  client_secret   = var.azure_sp_client_secret
  tenant_id       = var.azure_sp_tenant_id
}
