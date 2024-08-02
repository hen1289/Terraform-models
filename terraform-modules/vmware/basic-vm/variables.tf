variable "vsphere_username" {
  default = ""
}

variable "vsphere_password" {
  default = ""
}

variable "vsphere_server" {
  default = ""
}

variable "resource_pool_id" {
  default = ""
}

variable "datastore_id" {
  default = ""
}

variable "template_guest_id" {
  default = ""
}

variable "network_id" {
  default = ""
}

variable "tags_ids" {
  default = []
}

variable "adapter_type" {
  default = "vmxnet3"
}

variable "eagerly_scrub" {
  default = ""
}

variable "thin_provisioned" {
  default = ""
}

variable "eagerly_scrub_data_disk" {
  default = ""
}

variable "thin_provisioned_data_disk" {
  default = ""
}

variable "template_id" {
  default = ""
}

variable "vm_netmask" {
  default = ""
}

variable "vm_gateway" {
  default = ""
}

variable "vm_dns" {
  default = []
}

variable "vm_public_key" {
  default = ""
}

variable "vm_root_password" {
  default = ""
}

variable "name" {
  default = "basic"
}

variable "vm_prefix" {
  default = "axx"
}

variable "ip_address" {
  default = ""
}

variable "vcpu" {
  default = 2
}

variable "memory" {
  default = 2
}

variable "disk_size" {
  default = 10
}

variable "data_disk_size" {
  default = 0
}

variable "cpu_hot_add_enabled" {
  default = false
}

variable "memory_hot_add_enabled" {
  default = false
}
