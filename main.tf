provider "aci" {
  url            = "https://192.168.1.100"
  username       = "admin"
  password       = "cisco123"
  allow_insecure = true
}

resource "aci_tenant" "tennant_1" {
  name        = "ignw-tenant-1"
  description = "IGNW Tennant 1"
}
