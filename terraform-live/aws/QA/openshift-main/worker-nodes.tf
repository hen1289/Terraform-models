module "worker-nodes" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/services/QA/openshift"

  cluster_name          = "dotgroup-okd3-qa"
  name                  = "okd3-qa-node"
  key_name              = "default_qa"
  instance_count        = 6
  instance_type         = "c5.2xlarge"
  main_disk_size        = 10
  docker_pool_disk_size = 60
  var_disk_size         = 90
  subnet_id = "subnet-05872fb3889e7b981"
  vpc_security_group_ids = ["sg-01d95825bef0e33c1"]
}
