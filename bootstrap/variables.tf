variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Resource group for Terraform state"
  type        = string
  default     = "rg-ricvera-dev-eastus-001"
}

variable "storage_account_name" {
  description = "Storage account for tfstate"
  type        = string
  default     = "tfstatericveradev01"
}

variable "container_name" {
  description = "Container for Terraform state"
  type        = string
  default     = "tfstate-ricvera-dev"
}