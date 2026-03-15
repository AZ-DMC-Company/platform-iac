resource "azurerm_mysql_flexible_server" "grafana_db" {
  name                = "${var.workload}-grafana-db-${var.env}-01"
  resource_group_name = azurerm_resource_group.rg_app.name
  location            = azurerm_resource_group.rg_app.location
  version             = "8.0"
  sku_name            = "B1MS"
  storage_mb          = 512
  administrator_login = "grafanaadmin"
  administrator_password = var.grafana_mysql_password
  backup_retention_days = 7
  high_availability     = "Disabled"
  public_network_access_enabled = true
}

resource "azurerm_mysql_flexible_server_database" "grafana_db_name" {
  name                = "grafana"
  resource_group_name = azurerm_resource_group.rg_app.name
  server_name         = azurerm_mysql_flexible_server.grafana_db.name
}