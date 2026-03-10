variable "location" {
  type    = string
  default = "East US"
}

variable "resource_group_name" {
  type    = string
  default = "rg-containerapps-demo"
}

variable "backend_image" {
  description = "Docker image for Spring Boot API"
  type        = string
}

variable "frontend_image" {
  description = "Docker image for React frontend"
  type        = string
}