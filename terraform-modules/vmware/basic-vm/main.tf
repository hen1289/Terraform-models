provider "vsphere" {
  user                 = var.vsphere_username
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

resource "vsphere_virtual_machine" "vm" {
  name             = "${var.vm_prefix}-${var.name}"
  resource_pool_id = var.resource_pool_id
  datastore_id     = var.datastore_id
  tags             = var.tags_ids

  wait_for_guest_net_routable = false
  wait_for_guest_net_timeout = 0

  num_cpus = var.vcpu
  memory   = var.memory * 1024
  guest_id = var.template_guest_id

  cpu_hot_add_enabled = var.cpu_hot_add_enabled
  memory_hot_add_enabled = var.memory_hot_add_enabled

  network_interface {
    network_id   = var.network_id
    adapter_type = var.adapter_type
  }

  # main disk
  disk {
    label            = "${var.vm_prefix}-${var.name}.vmdk"
    size             = var.disk_size
    eagerly_scrub    = var.eagerly_scrub
    thin_provisioned = var.thin_provisioned
  }

  # data disk
  dynamic "disk" {
    for_each = var.data_disk_size > 0 ? [0] : []

    content {
      label            = "${var.vm_prefix}-${var.name}-data.vmdk"
      size             = var.data_disk_size
      eagerly_scrub    = var.eagerly_scrub_data_disk
      thin_provisioned = var.thin_provisioned_data_disk
      unit_number      = 2
    }
  }

  clone {
    template_uuid = var.template_id

    customize {
      timeout = "20"

      linux_options {
        host_name = "${var.vm_prefix}-${var.name}"
        domain    = "dot.group"
      }

      network_interface {
        ipv4_address = var.ip_address
        ipv4_netmask = var.vm_netmask
      }

      ipv4_gateway    = var.vm_gateway
      dns_server_list = var.vm_dns
    }
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p /root/.ssh",
      "touch /root/.ssh/authorized_keys",
      "echo ${var.vm_public_key} > /root/.ssh/authorized_keys",
      "chown root:root -R /root/.ssh",
      "chmod 700 /root/.ssh",
      "chmod 600 /root/.ssh/authorized_keys",
      "passwd --lock root"
    ]
  }

  connection {
    host     = var.ip_address
    type     = "ssh"
    user     = "root"
    password = var.vm_root_password
  }
}
