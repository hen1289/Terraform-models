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
  default = "os"
}

variable "vm_prefix" {
  default = "axx"
}

variable "lb_ip" {
  default = ""
}

variable "master_ips" {
  default = []
}

variable "worker_ips" {
  default = []
}

variable "glusterfs_node_disk_size" {
  default = 80
}

variable "glusterfs_node_devices" {
  default = 0
}

variable "master_node_vcpu" {
  default = 16
}

variable "master_node_memory" {
  default = 16
}

variable "master_node_storage" {
  default = 80
}

variable "worker_node_vcpu" {
  default = 16
}

variable "worker_node_memory" {
  default = 16
}

variable "worker_node_storage" {
  default = 60
}

variable "docker_pool_storage" {
  default = 40
}
