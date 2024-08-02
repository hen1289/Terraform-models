module "master-nodes" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/services/openshift"

  cluster_name          = "dotgroup-okd3-hom"
  name                  = "okd3-hom-master"
  key_name              = "default_hom"
  instance_count        = 3
  multiple_az           = true
  instance_type         = "c5.2xlarge"
  main_disk_size        = 10
  docker_pool_disk_size = 60
  var_disk_size         = 90
  subnet_id = ""
  vpc_security_group_ids = ""
  }
