provider "aws" {
  region = var.region
}

resource "aws_instance" "proxy" {
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
    Name = var.name
  }
}

resource "aws_ebs_volume" "data" {
  type = "gp3"
  availability_zone = aws_instance.proxy.availability_zone
  size              = var.data_disk_size
}

resource "aws_volume_attachment" "data_ec2" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.data.id
  instance_id = aws_instance.proxy.id
}
