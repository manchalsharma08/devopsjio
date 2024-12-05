resource "azurerm_mssql_server" "msql" {
    for_each = var.msql_var
  name                         = each.value.name_mss
  resource_group_name          = each.value.name_rg
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_database" "msdb" {
    for_each = var.msql_var
  name         =each.value.name_msdb
  server_id    = azurerm_mssql_server.msql[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}
