
resource "azurerm_sql_server" "sqlserver" {
  name                         = var.sqlserver_name
  resource_group_name          = azurerm_resource_group.rg-database.name
  location                     = azurerm_resource_group.rg-database.location
  version                      = var.sqlserver_version
  administrator_login          = var.sqlserver_admin_login
  administrator_login_password = var.sqlserver_admin_password

   tags       = var.tags

   depends_on = [azurerm_resource_group.rg-database]
}