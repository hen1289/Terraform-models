provider "vsphere" {
  user                 = var.vsphere_username
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

module "base" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//vmware/global/base"

  vsphere_username        = var.vsphere_username
  vsphere_password        = var.vsphere_password
  vsphere_server          = var.vsphere_server
  vsphere_compute_cluster = var.vsphere_compute_cluster
  vsphere_datacenter      = var.vsphere_datacenter
  vsphere_template_image  = var.vsphere_template_image
  vsphere_datastore       = var.vsphere_datastore
  vsphere_network         = var.vsphere_network
  vm_netmask              = var.vm_netmask
  vm_gateway              = var.vm_gateway
  vm_dns                  = var.vm_dns
  vm_public_key           = chomp(file(var.public_key_path))
  vm_root_password        = var.vm_root_password
}

resource "vsphere_tag" "tag" {
  name        = var.veeam_tag_name
  category_id = module.base.veeam_tag_category_id
}
