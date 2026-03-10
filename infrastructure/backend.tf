terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstateplatform001"
    container_name       = "tfstate"
    key                  = "containerapps-demo.tfstate"
  }
}