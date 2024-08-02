
resource "aws_instance" "main" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  availability_zone           = "${var.region}${var.availability_zone}"
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.public_access
  user_data                   = data.cloudinit_config.main.rendered

  root_block_device {
    volume_type           = "gp3"
    volume_size           = var.main_disk_size
    delete_on_termination = true
    encrypted             = true
  }

  tags = var.tags
}

data "cloudinit_config" "main" {
  gzip          = true
  base64_encode = true
  part {
    filename     = "common.cfg"
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/scripts/common.yml", {})
  }
  part {
    filename     = "custom-${var.script_name}.cfg"
    content_type = "text/x-shellscript"
    content      = templatefile("${path.module}/scripts/${var.script_name}.sh", {})
  }
}
resource "aws_ebs_volume" "data" {
  type              = "gp3"
  availability_zone = aws_instance.main.availability_zone
  size              = var.data_disk_size
  encrypted         = true
}

resource "aws_volume_attachment" "data_ec2" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.data.id
  instance_id = aws_instance.main.id
}
