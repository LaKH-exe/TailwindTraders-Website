terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}


provider "azurerm" {
    features {
      
    }
  
}

resource "azurerm_resource_group" "rg" {
    name = var.resource_group_name
    location = var.default_location
 tags = {
    Env              = "Test",
    deploymentMethod = "terraform",
    Owner            = "La",
    Region           = "westus"
  }
}

resource "azurerm_service_plan" "servicePlan" {
    name = "plan-westus-test"
    location = var.default_location
    os_type = "Linux"
    sku_name = "B2"

 tags = {
    Env              = "Test",
    deploymentMethod = "terraform",
    Owner            = "La",
    Region           = "westus"
  }
}


resource "azurerm_linux_web_app" "app" {
    name = "app-westus-test"
    location = var.default_location
    service_plan_id = azurerm_service_plan.example.id

  site_config {
    
  }

   tags = {
    Env              = "Test",
    deploymentMethod = "terraform",
    Owner            = "La",
    Region           = "westus"
  }
}