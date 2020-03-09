resource "azurerm_role_assignment" "ra-network-contributor" {
  scope                = azurerm_subnet.aks_subnet.id
  role_definition_name = "Network Contributor"
  principal_id         = var.azure_sp_object_id

  depends_on = [azurerm_subnet.aks_subnet]
}

resource "azurerm_role_assignment" "ra-managed-identity" {
  scope                = azurerm_user_assigned_identity.identity-xyz-reality.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = var.azure_sp_object_id
  depends_on           = [azurerm_user_assigned_identity.identity-xyz-reality]
}

resource "azurerm_role_assignment" "ra_contributor" {
  scope                = azurerm_application_gateway.appgw-network.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.identity-xyz-reality.principal_id
  depends_on           = [azurerm_user_assigned_identity.identity-xyz-reality, azurerm_application_gateway.appgw-network]
}

resource "azurerm_role_assignment" "ra_reader" {
  scope                = azurerm_resource_group.rg-k8s.id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.identity-xyz-reality.principal_id
  depends_on           = [azurerm_user_assigned_identity.identity-xyz-reality, azurerm_application_gateway.appgw-network, azurerm_resource_group.rg-k8s]
}
