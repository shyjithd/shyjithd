terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
      version = "1.0.1"
    }
  }
}

provider "aci" {
  url            = "https://192.168.1.100"
  username       = "admin"
  password       = "cisco123"
}

resource "aci_tenant" "test" {
  name        = "ignw-tenant-1"
  description = "IGNW Tennant 1"
}
