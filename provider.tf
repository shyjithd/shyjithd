terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
      version = "1.0.1"
    }
  }
}
provider "aci" {
  #version = "0.3.4"
  # Cisco ACI user name
  username = var.apic_user
  # Cisco ACI password
  password = var.apic_pass
  # Cisco ACI URL
  url      = var.apic_host
  insecure = true
}
