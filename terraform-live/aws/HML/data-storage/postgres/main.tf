module "postgres-main" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/data-stores/postgres"

  name              = "postgres-hom"
  key_name          = "default_hom"
  instance_type     = "m5.large"
  main_disk_size    = 50
  data_disks_count  = 3
  data_disks_size   = 300
  logs_disk_size    = 100
  backups_disk_size = 500
}
