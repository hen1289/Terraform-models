module "postgres-replica" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/data-stores/postgres"

  name              = "postgres-hom-15.3-replica"
  key_name          = "default_hom"
  instance_type     = "t3.medium"
  main_disk_size    = 50
  data_disks_count  = 1
  data_disks_size   = 1024
}
