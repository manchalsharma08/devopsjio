resource "azurerm_container_registry" "acr" {
    for_each = var.acr
  name                = each.value.name_acr
  resource_group_name = each.value.name_rg
  location            = each.value.location
  sku                 = "Basic"
  admin_enabled       = false

}