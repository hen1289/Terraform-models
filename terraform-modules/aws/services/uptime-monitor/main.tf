provider "aws" {
  region = var.region
}

resource "aws_instance" "uptime-monitor" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  availability_zone           = "${var.region}${var.availability_zone}"

  associate_public_ip_address = true

  root_block_device {
    volume_type           = "standard"
    volume_size           = var.main_disk_size
    delete_on_termination = true
  }

  tags = {
    Name = var.name
  }
}
