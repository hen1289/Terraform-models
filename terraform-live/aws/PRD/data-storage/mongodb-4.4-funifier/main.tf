module "mongodb-40" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/data-stores/mongodb"

  name           = "mongodb-4.4-funifier"
  key_name       = "default_prd"
  instance_type  = "t3a.medium"
  data_disk_size = 40
}
