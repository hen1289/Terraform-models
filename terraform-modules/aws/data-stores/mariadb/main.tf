provider "aws" {
  region = var.region
}

resource "aws_instance" "mariadb" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  availability_zone           = "${var.region}${var.availability_zone}"

  associate_public_ip_address = true

  root_block_device {
    volume_type           = "gp3"
    volume_size           = var.main_disk_size
    delete_on_termination = true
  }

  tags = {
    Name = "${var.name}"
  }
}

# data disk

resource "aws_ebs_volume" "data" {
  type = "gp3"
  count             = var.data_disks_count
  availability_zone = aws_instance.mariadb.availability_zone
  size              = var.data_disks_size
  tags              = {
    Name = "${var.name}-data${count.index + 1}"
  }
}

resource "aws_volume_attachment" "data_ec2" {
  count       = var.data_disks_count
  device_name = var.data_volume_device_list[count.index]
  volume_id   = aws_ebs_volume.data[count.index].id
  instance_id = aws_instance.mariadb.id
}

# logs disk

resource "aws_ebs_volume" "logs" {
  count             = var.logs_disk_size > 0 ? 1 : 0
  availability_zone = aws_instance.mariadb.availability_zone
  size              = var.logs_disk_size
  type              = "standard"
  tags              = {
    Name = "${var.name}-logs"
  }
}

resource "aws_volume_attachment" "logs_ec2" {
  count       = var.logs_disk_size > 0 ? 1 : 0
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.logs[count.index].id
  instance_id = aws_instance.mariadb.id
}

# backups disk

resource "aws_ebs_volume" "backups" {
  count             = var.backups_disk_size > 0 ? 1 : 0
  availability_zone = aws_instance.mariadb.availability_zone
  size              = var.backups_disk_size
  type              = "standard"
  tags              = {
    Name = "${var.name}-backups"
  }
}

resource "aws_volume_attachment" "backups_ec2" {
  count       = var.backups_disk_size > 0 ? 1 : 0
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.backups[count.index].id
  instance_id = aws_instance.mariadb.id
}
