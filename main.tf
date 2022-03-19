# HCL Language
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.92.0"
    }
  }
  
}

provider "azurerm" {
  features {}
}

# first string is type of resource, second is name of resource for just this file - combo must be unique
resource "azurerm_resource_group" "tf_test" {
  name = "tf_main_rg" # name of resource on azure
  location = "Central US" # `az account list-locations` in CLI for options
}

resource "azurerm_container_group" "tf_cg_test" {
  name = "tf_container_weatherapi"
  location = azurerm_resource_group.tf_test.location # references resource above as variable
  resource_group_name = azurerm_resource_group.tf_test.name
  
  ip_address_type = "public"
  dns_name_label = "kevingineering-terraform-weatherapi"
  os_type = "linux"

  container {
    name = "weatherapi"
    image = "kevingineering/terraform"
    cpu = "1"
    memory = "1"
    ports {
      port = 80
      protocol = "TCP"
    }
  }
}

