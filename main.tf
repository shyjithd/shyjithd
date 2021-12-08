terraform {
  required_providers {
    aci = {
      source = "ciscodevnet/aci"
      version = "0.7.1"
    }
  }
  required_version = ">= 0.5.3"
}
provider "aci" {
  username = "admin"
  password = "cisco123"
  url      = "https://192.168.1.100"
  insecure = true
}

resource "aci_tenant" "test" {
  name        = "ignw-tenant-1"
  description = "IGNW Tennant 1"
}
