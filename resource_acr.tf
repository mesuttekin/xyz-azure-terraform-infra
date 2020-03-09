resource "azurerm_container_registry" "acr" {
  name                     = format("%s%s", var.acr_name, var.project_name)
  resource_group_name      = azurerm_resource_group.rg-global.name
  location                 = azurerm_resource_group.rg-global.location
  sku                      = var.acr_sku
  admin_enabled            = var.acr_admin_enabled
  georeplication_locations = var.acr_georeplication_locations

  depends_on = [azurerm_resource_group.rg-global]
}
