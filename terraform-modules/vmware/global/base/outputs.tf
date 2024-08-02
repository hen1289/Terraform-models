output "vsphere_username" {
  value = var.vsphere_username
}

output "vsphere_password" {
  value = var.vsphere_password
}

output "vsphere_server" {
  value = var.vsphere_server
}

output "resource_pool_id" {
  value = data.vsphere_compute_cluster.cluster.resource_pool_id
}

output "datastore_id" {
  value = data.vsphere_datastore.datastore.id
}

output "template_guest_id" {
  value = data.vsphere_virtual_machine.template.guest_id
}

output "network_id" {
  value = data.vsphere_network.network.id
}

output "adapter_type" {
  value = data.vsphere_virtual_machine.template.network_interface_types.0
}

output "eagerly_scrub" {
  value = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
}

output "thin_provisioned" {
  value = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
}

output "template_id" {
  value = data.vsphere_virtual_machine.template.id
}

output "vm_netmask" {
  value = var.vm_netmask
}

output "vm_gateway" {
  value = var.vm_gateway
}

output "vm_dns" {
  value = var.vm_dns
}

output "vm_public_key" {
  value = var.vm_public_key
}

output "vm_root_password" {
  value = var.vm_root_password
}

output "veeam_tag_category_id" {
  value = data.vsphere_tag_category.veeam_tag_category.id
}
