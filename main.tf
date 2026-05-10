terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "environment" {
  description = "The environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region to deploy into"
  type        = string
  default     = "uksouth"
}

resource "azurerm_resource_group" "main" {
  name     = "rg-myproject-${var.environment}"
  location = var.location

  tags = {
    environment = var.environment
    managed_by  = "terraform"
  }
}

resource "azurerm_virtual_network" "main" {
  name                = "vnet-myproject-dev"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = var.environment
    managed_by  = "terraform"
  }
}