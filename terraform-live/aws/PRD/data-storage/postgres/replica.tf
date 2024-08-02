module "postgres-replica" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/data-stores/postgres"

  name              = "postgres-replica2"
  key_name          = "default_prd"
  instance_type     = "m5.large"
  main_disk_size    = 50
  data_disks_count  = 1
  data_disks_size   = 1024
}
