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