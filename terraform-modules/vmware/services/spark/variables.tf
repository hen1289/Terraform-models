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
  default = "spark"
}

variable "vm_prefix" {
  default = "axx"
}

variable "master_ips" {
  default = []
}

variable "worker_ips" {
  default = []
}

variable "master_node_vcpu" {
  default = 4
}

variable "master_node_memory" {
  default = 8
}

variable "master_node_storage" {
  default = 20
}

variable "worker_node_vcpu" {
  default = 4
}

variable "worker_node_memory" {
  default = 8
}

variable "worker_node_storage" {
  default = 20
}

variable "data_disk_storage" {
  default = 60
}
