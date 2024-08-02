module "gvm-instance" {
  source = "git::git@github.com:dotdigitalgroup/terraform-modules.git//aws/services/generic-ec2"

  key_name          = var.key_name
  instance_type     = var.instance_type
  ami               = var.ami
  main_disk_size    = var.main_disk_size
  data_disk_size    = var.data_disk_size
  script_name       = var.script_name
  region            = var.region
  availability_zone = var.availability_zone
  subnet_id         = var.subnet_id
  tags              = var.tags
  access_key        = var.access_key
  secret_key        = var.secret_key
  public_access     = var.public_access
}
