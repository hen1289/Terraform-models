module "mariadb-main" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/data-stores/mariadb"

  name              = "mariadb-main"
  key_name          = "default_prd"
  instance_type     = "m5.xlarge"
  main_disk_size    = 50
  data_disks_count  = 3
  data_disks_size   = 150
  logs_disk_size    = 100
  backups_disk_size = 500
}
