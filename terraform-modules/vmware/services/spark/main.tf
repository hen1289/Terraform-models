provider "vsphere" {
  user                 = var.vsphere_username
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

resource "vsphere_virtual_machine" "spark_master" {
  count            = length(var.master_ips)
  name             = "${var.vm_prefix}-${var.name}-master"
  annotation       = "Apache Spark Master"
  resource_pool_id = var.resource_pool_id
  datastore_id     = var.datastore_id
  tags             = var.tags_ids

  wait_for_guest_net_routable = false
  wait_for_guest_net_timeout = 0

  num_cpus = var.master_node_vcpu
  memory   = var.master_node_memory * 1024
  guest_id = var.template_guest_id

  network_interface {
    network_id   = var.network_id
    adapter_type = var.adapter_type
  }

  # main disk
  disk {
    label            = "${var.name}-master.vmdk"
    size             = var.master_node_storage
    eagerly_scrub    = var.eagerly_scrub
    thin_provisioned = var.thin_provisioned
  }

  # data disk
  disk {
    label            = "${var.name}-master-data.vmdk"
    size             = var.data_disk_storage
    eagerly_scrub    = var.eagerly_scrub
    thin_provisioned = var.thin_provisioned
    unit_number      = 1
  }

  clone {
    template_uuid = var.template_id

    customize {
      timeout = "20"

      linux_options {
        host_name = "${var.vm_prefix}-${var.name}-master"
        domain    = "dot.group"
      }

      network_interface {
        ipv4_address = var.master_ips[count.index]
        ipv4_netmask = var.vm_netmask
      }

      ipv4_gateway    = var.vm_gateway
      dns_server_list = var.vm_dns
    }
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir /root/.ssh",
      "touch /root/.ssh/authorized_keys",
      "echo ${var.vm_public_key} >> /root/.ssh/authorized_keys",
      "chown root:root -R /root/.ssh",
      "chmod 700 /root/.ssh",
      "chmod 600 /root/.ssh/authorized_keys",
      "passwd --lock root"
    ]
  }

  connection {
    host     = var.master_ips[count.index]
    type     = "ssh"
    user     = "root"
    password = var.vm_root_password
  }
}

resource "vsphere_virtual_machine" "spark_worker" {
  count            = length(var.worker_ips)
  name             = "${var.vm_prefix}-${var.name}-worker${count.index + 1}"
  annotation       = "Apache Spark Worker"
  resource_pool_id = var.resource_pool_id
  datastore_id     = var.datastore_id
  tags             = var.tags_ids

  wait_for_guest_net_routable = false
  wait_for_guest_net_timeout = 0

  num_cpus = var.worker_node_vcpu
  memory   = var.worker_node_memory * 1024
  guest_id = var.template_guest_id

  network_interface {
    network_id   = var.network_id
    adapter_type = var.adapter_type
  }

  # main disk
  disk {
    label            = "${var.name}-worker${count.index + 1}.vmdk"
    size             = var.worker_node_storage
    eagerly_scrub    = var.eagerly_scrub
    thin_provisioned = var.thin_provisioned
  }

  # data disk
  disk {
    label            = "${var.name}-worker-data${count.index + 1}.vmdk"
    size             = var.data_disk_storage
    eagerly_scrub    = var.eagerly_scrub
    thin_provisioned = var.thin_provisioned
    unit_number      = 1
  }

  clone {
    template_uuid = var.template_id

    customize {
      timeout = "20"

      linux_options {
        host_name = "${var.vm_prefix}-${var.name}-worker${count.index + 1}"
        domain    = "dot.group"
      }

      network_interface {
        ipv4_address = var.worker_ips[count.index]
        ipv4_netmask = var.vm_netmask
      }

      ipv4_gateway    = var.vm_gateway
      dns_server_list = var.vm_dns
    }
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir /root/.ssh",
      "touch /root/.ssh/authorized_keys",
      "echo ${var.vm_public_key} >> /root/.ssh/authorized_keys",
      "chown root:root -R /root/.ssh",
      "chmod 700 /root/.ssh",
      "chmod 600 /root/.ssh/authorized_keys",
      "passwd --lock root"
    ]
  }

  connection {
    host     = var.worker_ips[count.index]
    type     = "ssh"
    user     = "root"
    password = var.vm_root_password
  }
}
