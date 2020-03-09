resource "azurerm_key_vault" "key_vault_xyz-reality" {
  name                        = format("%s-%s", var.key_vault_name, var.project_name)
  location                    = azurerm_resource_group.rg-global.location
  resource_group_name         = azurerm_resource_group.rg-global.name
  enabled_for_disk_encryption = var.key_vault_enabled_for_disk_encryption
  tenant_id                   = var.azure_sp_tenant_id

  sku_name = var.key_vault_sku_name

  access_policy {
    tenant_id = var.azure_sp_tenant_id
    object_id = var.azure_sp_object_id

    key_permissions = [
      "get",
    ]

    secret_permissions = [
      "get",
    ]

    storage_permissions = [
      "get",
    ]
  }

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }

  tags = {
    environment = var.env
  }

  depends_on = [azurerm_resource_group.rg-global]
}
