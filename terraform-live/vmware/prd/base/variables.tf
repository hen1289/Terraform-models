variable "vsphere_username" {
  default = "dotgroup01@vsphere.local"
}

variable "vsphere_password" {
  default = ""
}

variable "vsphere_server" {
  default = "10.10.0.10"
}

variable "vsphere_compute_cluster" {
  default = "Cluster DotGroup"
}

variable "vsphere_datacenter" {
  default = "DOTGROUP"
}

variable "vsphere_template_image" {
  default = "centos7-minimal"
}

variable "vsphere_datastore" {
  default = "VMFS_STORAGE_T2_DOTGROUP_002"
}

variable "vsphere_network" {
  default = "PG REDE PROD DOTGROUP - VLAN 2700"
}

variable "vm_netmask" {
  default = "16"
}

variable "vm_gateway" {
  default = "10.20.0.1"
}

variable "vm_dns" {
  default = ["10.20.0.4", "192.168.1.250"]
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
