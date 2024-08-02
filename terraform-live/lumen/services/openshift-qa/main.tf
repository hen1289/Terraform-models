module "provider-config" {
  source = "../../base"

  vsphere_password       = var.vsphere_password
  public_key_path        = var.public_key_path
  vm_root_password       = var.vm_root_password
  vsphere_template_image = var.vsphere_template_image
  vsphere_datastore      = "VMFS_STORAGE_T2_DOTGROUP_001"
  veeam_tag_name         = "qa-okd"
}

module "openshift" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//vmware/services/openshift"

  vsphere_username = module.provider-config.vsphere_username
  vsphere_password = module.provider-config.vsphere_password
  vsphere_server = module.provider-config.vsphere_server
  resource_pool_id = module.provider-config.resource_pool_id
  datastore_id = module.provider-config.datastore_id
  template_guest_id = module.provider-config.template_guest_id
  network_id = module.provider-config.network_id
  adapter_type = "vmxnet3"
  eagerly_scrub = module.provider-config.eagerly_scrub
  thin_provisioned = module.provider-config.thin_provisioned
  template_id = module.provider-config.template_id
  vm_netmask = module.provider-config.vm_netmask
  vm_gateway = module.provider-config.vm_gateway
  vm_dns = module.provider-config.vm_dns
  vm_public_key = module.provider-config.vm_public_key
  vm_root_password = module.provider-config.vm_root_password
  tags_ids = [
    module.provider-config.veeam_tag_id
  ]

  name = "okd"
  vm_prefix = "adq"
  master_ips = [
    "10.20.1.120"
  ]
  worker_ips = [
    "10.20.1.123",
    "10.20.1.124",
    "10.20.1.125",
    "10.20.1.126",
    "10.20.1.127"
  ]
}
