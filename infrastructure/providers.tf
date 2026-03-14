provider "azurerm" {
  features {}
}
terraform {
  required_version = ">= 1.5"

  backend "azurerm" {
    resource_group_name  = "orders-rg-tfstate-dev-eus-01"
    storage_account_name = "orderssttfdev01"
    container_name       = "tfstate"
    key                  = "app-infrastructure.tfstate"
  }
}