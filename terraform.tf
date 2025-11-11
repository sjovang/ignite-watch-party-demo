terraform {
    required_providers {
      azuread = {
        source = "hashicorp/azuread"
        version = "~> 3.0"
      }
      azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 4.0"
      }
      msgraph = {
        source = "microsoft/msgraph"
        version = "~> 0.2"
      }
    }
    required_version = "~> 1.0"
}