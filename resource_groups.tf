resource "azurerm_resource_group" "rg-k8s" {
  name     = format("%s-%s", var.resource_group_name_k8s, var.location)
  location = var.location

  tags = {
    environment = var.env
  }
}

resource "azurerm_resource_group" "rg-net" {
  name     = format("%s-%s", var.resource_group_name_net, var.location)
  location = var.location

  tags = {
    environment = var.env
  }
}

resource "azurerm_resource_group" "rg-global" {
  name     = format("%s-%s", var.resource_group_name_global, var.location)
  location = var.location

  tags = {
    environment = var.env
  }
}

resource "azurerm_resource_group" "rg-database" {
  name     = format("%s-%s", var.resource_group_name_database, var.location)
  location = var.location
}

