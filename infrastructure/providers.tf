terraform {
  required_version = ">= 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.77"  # fijamos una versión 3.x compatible con tus tf
    }
  }

  backend "azurerm" {
    resource_group_name  = "orders-rg-tfstate-dev-eus-01"
    storage_account_name = "orderssttfdev01"
    container_name       = "tfstate"
    key                  = "app-infrastructure.tfstate"
  }
}

provider "azurerm" {
  features {}
}