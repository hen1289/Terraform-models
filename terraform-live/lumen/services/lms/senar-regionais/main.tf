module "provider-config" {
  source = "../../../base"

  vsphere_password       = var.vsphere_password
  public_key_path        = var.public_key_path
  vm_root_password       = var.vm_root_password
  vsphere_template_image = var.vsphere_template_image
  veeam_tag_name         = "prd-lms-senar"
}

module "lms-senar" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//vmware/basic-vm"

  vsphere_username = module.provider-config.vsphere_username
  vsphere_password = module.provider-config.vsphere_password
  vsphere_server = module.provider-config.vsphere_server
  resource_pool_id = module.provider-config.resource_pool_id
  datastore_id = module.provider-config.datastore_id
  template_guest_id = module.provider-config.template_guest_id
  network_id = module.provider-config.network_id
  adapter_type = module.provider-config.adapter_type
  eagerly_scrub = module.provider-config.eagerly_scrub
  thin_provisioned = module.provider-config.thin_provisioned
  eagerly_scrub_data_disk = false
  thin_provisioned_data_disk = true
  template_id = module.provider-config.template_id
  vm_netmask = module.provider-config.vm_netmask
  vm_gateway = module.provider-config.vm_gateway
  vm_dns = module.provider-config.vm_dns
  vm_public_key = module.provider-config.vm_public_key
  vm_root_password = module.provider-config.vm_root_password
  cpu_hot_add_enabled = true
  memory_hot_add_enabled = true
  tags_ids = [
    module.provider-config.veeam_tag_id
  ]

  name = "lms-senar"
  vm_prefix = "adp"
  ip_address = "10.20.1.40"
  disk_size = 20
  data_disk_size = 500
  memory = 3
  vcpu = 2
}
