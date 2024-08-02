module "load-balancer" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/services/openshift"

  cluster_name          = "dotgroup-okd3"
  name                  = "okd3-lb"
  key_name              = "default_prd"
  instance_count        = 1
  instance_type         = "t2.medium"
  main_disk_size        = 20
  is_load_balancer      = true
}
