# mysql.tf - compatible con azurerm 3.*
resource "azurerm_mysql_server" "grafana_db" {
  name                = "${var.workload}-grafana-db-${var.env}"
  resource_group_name = azurerm_resource_group.rg_app.name
  location            = azurerm_resource_group.rg_app.location
  administrator_login = "grafanaadmin"
  administrator_login_password = var.grafana_mysql_password
  version             = "5.7"

  sku_name = "B_Gen5_1"   # Gratis / mínima B-series
  storage_profile {
    storage_mb            = 5120
    backup_retention_days = 7
    geo_redundant_backup  = "Disabled"
  }

  ssl_enforcement = "Enabled"
}

# Base de datos Grafana
resource "azurerm_mysql_database" "grafana_db_name" {
  name                = "grafana"
  resource_group_name = azurerm_resource_group.rg_app.name
  server_name         = azurerm_mysql_server.grafana_db.name
  charset             = "utf8"
  collation           = "utf8_general_ci"
}