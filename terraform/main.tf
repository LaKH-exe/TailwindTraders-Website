terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 3.0.2"
    }
  }
backend "azurerm" {
  resource_group_name = "tfstate"
  storage_account_name = "tfstatetestlab55"
  container_name = "tfstate"
  key = "terrafrom.tfstate"
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
    Region           = "westus2"
  }
}

resource "azurerm_service_plan" "servicePlan" {
    name = "plan-westus-test"
    location = var.default_location
    resource_group_name = var.resource_group_name
    depends_on = [
      azurerm_resource_group.rg
    ]
    os_type = "Linux"
    sku_name = "B2"

 tags = {
    Env              = "Test",
    deploymentMethod = "terraform",
    Owner            = "La",
    Region           = "westus2"
  }
}


resource "azurerm_linux_web_app" "app" {
    name = "app-westus-test"
    location = var.default_location
    resource_group_name = var.resource_group_name
    service_plan_id = azurerm_service_plan.servicePlan.id
    depends_on = [
      azurerm_service_plan.servicePlan
    ]
  site_config {
    
  }

   tags = {
    Env              = "Test",
    deploymentMethod = "terraform",
    Owner            = "La",
    Region           = "westus2"
  }
}