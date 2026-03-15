resource "azurerm_container_app_environment" "cae" {
  name                = "${var.workload}-env-${var.env}-01"
  resource_group_name = azurerm_resource_group.rg_app.name
  location            = azurerm_resource_group.rg_app.location
}