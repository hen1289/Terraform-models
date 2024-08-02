module "mongodb-34" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/data-stores/mongodb"

  name           = "mongodb-3.4"
  key_name       = "default_prd"
  instance_type  = "t3a.medium"
}
