# Orders Azure Terraform Project

Este repositorio contiene la infraestructura como código para el proyecto académico de Orders App en Azure.

## Estructura

- `backend/` → Infraestructura para el backend de Terraform (state)
- `infrastructure/` → Infraestructura de la aplicación (CAE, contenedores)
- `.github/workflows/` → Workflows de GitHub Actions:
  - `backend-create.yml` → crea backend de Terraform
  - `backend-destroy.yml` → destruye backend (cuando hay backend remoto configurado)
  - `delete-rg.yml` → borra RG del backend vía Azure CLI