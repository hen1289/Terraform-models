terraform {
  required_providers {
    aws = {
      version = "4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "os" {
  count                       = var.instance_count
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  availability_zone           = var.multiple_az && var.instance_count <= 2 ? "${var.region}${var.az_map[count.index + 1]}" : "${var.region}${var.availability_zone}"
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.subnet_id
  root_block_device {
    volume_type           = "gp3"
    volume_size           = var.main_disk_size
    delete_on_termination = true
  }

  tags = {
    Name = var.instance_count > 1 ? "${var.name}${count.index + 1}" : var.name
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    "SomenteHorarioComercial" = true
  }
}

resource "aws_ebs_volume" "dp" {
  type = "gp3"
  count             = var.is_load_balancer ? 0 : var.instance_count
  availability_zone = aws_instance.os[count.index].availability_zone
  size              = var.docker_pool_disk_size
  tags              = {
    Name = "${var.name}${count.index + 1}-docker-pool"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_volume_attachment" "dp_ec2" {
  count       = var.is_load_balancer ? 0 : var.instance_count
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.dp[count.index].id
  instance_id = aws_instance.os[count.index].id
}

resource "aws_ebs_volume" "var" {
  type = "gp3"
  count             = var.is_load_balancer ? 0 : var.instance_count
  availability_zone = aws_instance.os[count.index].availability_zone
  size              = var.var_disk_size
  tags              = {
    Name = "${var.name}${count.index + 1}-var"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_volume_attachment" "var_ec2" {
  count       = var.is_load_balancer ? 0 : var.instance_count
  device_name = "/dev/sdi"
  volume_id   = aws_ebs_volume.var[count.index].id
  instance_id = aws_instance.os[count.index].id
}
