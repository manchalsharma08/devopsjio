terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.12.0"
    }
  }
}

provider "azurerm" {
  features {}

  # Optional: Use a specific subscription
  subscription_id = "cdad125a-4251-4921-9b54-69011bb91811"
}