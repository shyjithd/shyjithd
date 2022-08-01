# Basic configuration withour variables

# Define authentification configuration
provider "vsphere" {
  # If you use a domain set your login like this "MyDomain\\MyUser"
  user           = "Administrator@vsphere.local"
  password       = "Cisco@123"
  vsphere_server = "192.168.1.105"

  # if you have a self-signed cert
  allow_unverified_ssl = true
}

#### RETRIEVE DATA INFORMATION ON VCENTER ####

data "vsphere_datacenter" "dc" {
  name = "Datacenter"
}

data "vsphere_resource_pool" "pool" {
  # If you haven't resource pool, put "Resources" after cluster name
  name          = "CPOC-POOL"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_host" "host" {
  name          = "192.168.1.104"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Retrieve datastore information on vsphere
data "vsphere_datastore" "datastore" {
  name          = "datastore1"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Retrieve network information on vsphere
data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Retrieve template information on vsphere
data "vsphere_virtual_machine" "template" {
  name          = "Ubuntu-Base"
  datacenter_id = data.vsphere_datacenter.dc.id
}

#### VM CREATION ####

# Set vm parameters
resource "vsphere_virtual_machine" "vm-one" {
  name             = "ubuntu-terraform1"
  num_cpus         = 2
  memory           = 4096
  datastore_id     = data.vsphere_datastore.datastore.id
  host_system_id   = data.vsphere_host.host.id
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type

  # Set network parameters
  network_interface {
    network_id = data.vsphere_network.network.id
  }

 disk {
    label = "disk0"
    size = "60"
   thin_provisioned = "true"
  }
  
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id 
    customize {
      linux_options {
        host_name = "ubuntu-terraform1"
        domain    = "cpoc.local"
      }   
      network_interface {
        ipv4_address    = "192.168.1.109"
        ipv4_netmask    = 24
        dns_server_list = ["8.8.8.8", "8.8.4.4"]
      }

      ipv4_gateway = "192.168.1.254"
    }
  }
  
}


