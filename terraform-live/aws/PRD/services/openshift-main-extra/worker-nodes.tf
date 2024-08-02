module "worker-nodes" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/services/openshift"

  cluster_name          = "dotgroup-okd3"
  name                  = "okd3-node-extra"
  key_name              = "default_prd"
<<<<<<< HEAD:aws/services/openshift-main-extra/worker-nodes.tf
  instance_count        = 18
=======
  instance_count        = 15
>>>>>>> 9ccb8041da8e9f548e38ee4ca0199a45918c33a7:aws/PRD/services/openshift-main-extra/worker-nodes.tf
  instance_type         = "c5.2xlarge"
  main_disk_size        = 10
  docker_pool_disk_size = 60
  var_disk_size         = 90
<<<<<<< HEAD:aws/services/openshift-main-extra/worker-nodes.tf
  #vpc_security_group_ids = ""
  #subnet_id = ""
=======
  vpc_security_group_ids = ""
  subnet_id = ""
>>>>>>> 9ccb8041da8e9f548e38ee4ca0199a45918c33a7:aws/PRD/services/openshift-main-extra/worker-nodes.tf
}
