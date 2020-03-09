resource "azurerm_kubernetes_cluster" "k8s" {
  name       = format("%s-%s", var.aks_name, var.location)
  location   = azurerm_resource_group.rg-k8s.location
  dns_prefix = var.aks_dns_prefix

  resource_group_name = azurerm_resource_group.rg-k8s.name

  linux_profile {
    admin_username = var.vm_user_name

    ssh_key {
      key_data = file(var.public_ssh_key_path)
    }
  }

  addon_profile {
    http_application_routing {
      enabled = false
    }
  }

  default_node_pool {
    name            = "agentpool"
    node_count      = var.aks_agent_count
    vm_size         = var.aks_agent_vm_size
    os_disk_size_gb = var.aks_agent_os_disk_size
    vnet_subnet_id  = azurerm_subnet.aks_subnet.id
  }

  service_principal {
    client_id     = var.azure_sp_client_id
    client_secret = var.azure_sp_client_secret
  }

  network_profile {
    network_plugin     = "azure"
    dns_service_ip     = var.aks_dns_service_ip
    docker_bridge_cidr = var.aks_docker_bridge_cidr
    service_cidr       = var.aks_service_cidr
  }

  depends_on = [azurerm_subnet.aks_subnet, azurerm_application_gateway.appgw, azurerm_resource_group.rg-k8s]
  tags       = var.tags

}
