# User Assigned Identities
resource "azurerm_user_assigned_identity" "identity-xyz-reality" {
  resource_group_name = azurerm_resource_group.rg-net.name
  location            = azurerm_resource_group.rg-net.location

  name = "identity-xyz-reality"

  tags = var.tags

  depends_on = [azurerm_resource_group.rg-net]


}
