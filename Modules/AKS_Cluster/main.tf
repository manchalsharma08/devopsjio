resource "azurerm_kubernetes_cluster" "K8S" {
    for_each = var.k8s_var
  name                = each.value.name_aks
  location            = each.value.location
  resource_group_name = each.value.name_rg
  dns_prefix          = "devopsaks1"

  default_node_pool {
    name       = "nodepool"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
  }

  tags = {
    Environment = "Dev"
  }
}

# data "azurerm_container_registry" "dataACR" {
#     for_each = var.k8s_var
#     name = each.value.name_acr
#     resource_group_name = each.value.name_rg
  
# }

# resource "azurerm_role_assignment" "ARA" {
#   for_each                        = azurerm_kubernetes_cluster.K8S
#   principal_id                    = each.value.identity.principal_id
#   role_definition_name            = "AcrPull"
#   scope                           = data.azurerm_container_registry.dataACR[each.key].id
#   skip_service_principal_aad_check = true
# }