variable "vsphere_username" {
  default = "administrator@dotgroup.com.br"
}

variable "vsphere_password" {
  default = ""
}

variable "vsphere_server" {
  default = "192.168.1.99"
}

variable "vsphere_compute_cluster" {
  default = "DOT - Cluster"
}

variable "vsphere_datacenter" {
  default = "DOT - Matriz"
}

variable "vsphere_template_image" {
  default = "centos7-minimal"
}

variable "vsphere_datastore" {
  default = "VMs-I"
}

variable "vsphere_network" {
  default = "VM Network"
}

variable "vm_netmask" {
  default = "16"
}

variable "vm_gateway" {
  default = "192.168.1.1"
}

variable "vm_dns" {
  default = ["192.168.1.250"]
}

variable "public_key_path" {
  default = ""
}

variable "vm_root_password" {
  default = ""
}

variable "veeam_tag_name" {
  default = ""
}
