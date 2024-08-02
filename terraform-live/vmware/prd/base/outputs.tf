output "vsphere_username" {
  value = module.base.vsphere_username
}

output "vsphere_password" {
  value = module.base.vsphere_password
}

output "vsphere_server" {
  value = module.base.vsphere_server
}

output "resource_pool_id" {
  value = module.base.resource_pool_id
}

output "datastore_id" {
  value = module.base.datastore_id
}

output "template_guest_id" {
  value = module.base.template_guest_id
}

output "network_id" {
  value = module.base.network_id
}

output "adapter_type" {
  value = module.base.adapter_type
}

output "eagerly_scrub" {
  value = module.base.eagerly_scrub
}

output "thin_provisioned" {
  value = module.base.thin_provisioned
}

output "template_id" {
  value = module.base.template_id
}

output "vm_netmask" {
  value = module.base.vm_netmask
}

output "vm_gateway" {
  value = module.base.vm_gateway
}

output "vm_dns" {
  value = module.base.vm_dns
}

output "vm_public_key" {
  value = module.base.vm_public_key
}

output "vm_root_password" {
  value = module.base.vm_root_password
}

output "veeam_tag_id" {
  value = vsphere_tag.tag.id
}
