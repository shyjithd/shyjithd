terraform {
  required_providers {
    aci = {
      source = "ciscodevnet/aci"
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
