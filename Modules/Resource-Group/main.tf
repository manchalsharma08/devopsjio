resource "azurerm_resource_group" "RG" {
    for_each = var.rg_var
    name = each.value.name_rg
    location = "central india"
}