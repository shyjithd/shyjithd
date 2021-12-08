terraform {
  required_providers {
    aci = {
      source = "ciscodevnet/aci
    }
  }
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
