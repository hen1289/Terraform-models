module "ansible-bootstrap" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/services/ansible-bootstrap"

  name     = "ansible-bootstrap"
  key_name = "default_prd"
}
