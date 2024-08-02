module "mongodb-40" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/data-stores/mongodb"

  name           = "mongodb-4.0hom"
  key_name       = "default_hom"
  instance_type  = "m5.large"
  data_disk_size = 60
}
