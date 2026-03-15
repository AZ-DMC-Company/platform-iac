resource "azurerm_storage_account" "grafana" {
  name                     = "ordersgrafanadev01"
  resource_group_name      = azurerm_resource_group.rg_app.name
  location                 = azurerm_resource_group.rg_app.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "grafana" {
  name                        = "grafana"
  storage_account_name        = azurerm_storage_account.grafana.name
  quota                       = 1
}

resource "azurerm_container_app_environment" "cae" {
  name                = "${var.workload}-env-${var.env}-01"
  resource_group_name = azurerm_resource_group.rg_app.name
  location            = azurerm_resource_group.rg_app.location
}

resource "azurerm_container_app_environment_storage" "cae_storage" {
  name                         = "orderscaestoragedev01"
  container_app_environment_id = azurerm_container_app_environment.cae.id
  account_name                 = azurerm_storage_account.grafana.name
  share_name                   = azurerm_storage_share.grafana.name
  access_key                   = azurerm_storage_account.grafana.primary_access_key
  access_mode                  = "ReadOnly"
}