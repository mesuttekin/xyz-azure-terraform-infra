variable "project_name" {
  description = "Project name."
  default = "xyz-reality"
}

variable "azure_subscription_id" {
  description = "Azure substitution id."
}

variable "azure_sp_client_id" {
  description = "Application ID/Client ID  of the service principal. Used by AKS to manage AKS related resources on Azure like vms, subnets."
}

variable "azure_sp_client_secret" {
  description = "Azure service principal password. Used by AKS to manage Azure."
}

variable "azure_sp_tenant_id" {
  description = "Azure service principal tenant_id."
}

variable "azure_sp_object_id" {
  description = "Object ID of the service principal."
}

variable "env" {
  default = "Development"
}

variable "resource_group_name_k8s" {
  description = "Name of the k8s resource group."
  default     = "rg-k8s"
}

variable "resource_group_name_net" {
  description = "Name of the network resource group."
  default     = "rg-net"
}

variable "resource_group_name_global" {
  description = "Name of the global resource group."
  default     = "rg-global"
}

variable "acr_name" {
  description = "Name of the azure container registry."
  default     = "acr"
}

variable "acr_sku" {
  description = "sku of the azure container registry."
  default     = "Premium"
}

variable "acr_admin_enabled" {
  description = "admin status of the azure container registry."
  default     = false
}

variable "acr_georeplication_locations" {
  type    = list(string)

  default = ["westus", "northeurope"]
}

variable "location" {
  description = "Location of the cluster."
}

variable "virtual_network_name" {
  description = "Virtual network name"
  default     = "aks-virtual-network"
}

variable "virtual_network_address_prefix" {
  description = "Containers DNS server IP address."
  default     = "15.0.0.0/8"
}

variable "aks_subnet_name" {
  description = "AKS Subnet Name."
  default     = "kubesubnet"
}

variable "appgw_subnet_name" {
  description = "Application Gateway Subnet Name."
  default     = "appgwsubnet"
}

variable "aks_subnet_address_prefix" {
  description = "Containers DNS server IP address."
  default     = "15.0.0.0/16"
}

variable "app_gateway_subnet_address_prefix" {
  description = "Containers DNS server IP address."
  default     = "15.1.0.0/16"
}

variable "app_gateway_name" {
  description = "Name of the Application Gateway."
  default     = "appgw"
}

variable "app_gateway_sku" {
  description = "Name of the Application Gateway SKU."
  default     = "Standard_Small"
}

variable "app_gateway_tier" {
  description = "Tier of the Application Gateway SKU."
  default     = "Standard"
}

variable "app_gateway_sku_capacity" {
  description = "Capacity of the Application Gateway SKU."
  default     = 1
}



variable "aks_name" {
  description = "Name of the AKS cluster."
  default     = "aks-cluster"
}
variable "aks_dns_prefix" {
  description = "Optional DNS prefix to use with hosted Kubernetes API server FQDN."
  default     = "aks"
}

variable "aks_agent_os_disk_size" {
  description = "Disk size (in GB) to provision for each of the agent pool nodes. This value ranges from 0 to 1023. Specifying 0 applies the default disk size for that agentVMSize."
  default     = 40
}

variable "aks_agent_count" {
  description = "The number of agent nodes for the cluster."
  default     = 1
}

variable "aks_agent_vm_size" {
  description = "The size of the Virtual Machine."
  default     = "Standard_D12_v2"
}

variable "kubernetes_version" {
  description = "The version of Kubernetes."
  default     = "1.11.5"
}

variable "aks_service_cidr" {
  description = "A CIDR notation IP range from which to assign service cluster IPs."
  default     = "10.0.0.0/16"
}

variable "aks_dns_service_ip" {
  description = "Containers DNS server IP address."
  default     = "10.0.0.10"
}

variable "aks_docker_bridge_cidr" {
  description = "A CIDR notation IP for Docker bridge."
  default     = "172.17.0.1/16"
}

variable "aks_enable_rbac" {
  description = "Enable RBAC on the AKS cluster. Defaults to false."
  default     = "false"
}

variable "vm_user_name" {
  description = "User name for the VM"
  default     = "vmuser1"
}

variable "public_ssh_key_path" {
  description = "Public key path for SSH."
  default     = "~/.ssh/id_rsa.pub"
}

variable "tags" {
  type = map

  default = {
    source = "terraform"
  }
}

variable "key_vault_name" {
  default = "key-vault"
}

variable "key_vault_enabled_for_disk_encryption" {
  default = true
}

variable "key_vault_sku_name" {
  default = "standard"
}
