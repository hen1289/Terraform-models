module "mongodb-34" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/data-stores/mongodb"

  name           = "mongodb-3.4-hom"
  key_name       = "default_hom"
  instance_type  = "t3.medium"
}
