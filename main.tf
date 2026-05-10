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
resource "azurerm_subnet" "main" {
  name                 = "subnet-myproject-dev"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}
resource "azurerm_network_security_group" "main" {
  name                = "nsg-myproject-dev"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  security_rule {
    name                      = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"        
  }
  tags = {
    environment = var.environment
    managed_by  = "terraform"
  }
}
resource "azurerm_subnet_network_security_group_association" "main" {
  subnet_id                 = azurerm_subnet.main.id
  network_security_group_id = azurerm_network_security_group.main.id
}