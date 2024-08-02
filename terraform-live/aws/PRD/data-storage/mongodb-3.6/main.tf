module "mongodb-36" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/data-stores/mongodb"

  name           = "mongodb-3.6"
  key_name       = "default_prd"
  instance_type  = "m5.large"
  data_disk_size = 60
}
