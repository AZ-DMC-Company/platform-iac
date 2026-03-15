resource "azurerm_mysql_server" "grafana_db" {
  name                = "${var.workload}-grafana-db-${var.env}"
  location            = azurerm_resource_group.rg_app.location
  resource_group_name = azurerm_resource_group.rg_app.name

  administrator_login = "grafanaadmin"
  administrator_login_password = var.grafana_mysql_password

  sku_name = "B_Gen5_1"   # Gratis / mínima B-series
  version             = "5.7"
  storage_mb            = 5120

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

resource "azurerm_mysql_database" "grafana_db_name" {
  name                = "grafana"
  resource_group_name = azurerm_resource_group.rg_app.name
  server_name         = azurerm_mysql_server.grafana_db.name
  charset             = "utf8"
  collation           = "utf8_general_ci"
}