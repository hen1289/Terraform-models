module "ansible-bootstrap" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/services/ansible-bootstrap"

  name           = "proxy-prd-main"
  key_name       = "default_prd"
  instance_type  = "t3a.small"
  main_disk_size = 20
}
