module "master-nodes" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/services/openshift"

  cluster_name          = "dotgroup-okd3"
  name                  = "okd3-master"
  key_name              = "default_prd"
  instance_count        = 4
  multiple_az           = true
  instance_type         = "c5.2xlarge"
  main_disk_size        = 10
  docker_pool_disk_size = 60
  var_disk_size         = 90
}
