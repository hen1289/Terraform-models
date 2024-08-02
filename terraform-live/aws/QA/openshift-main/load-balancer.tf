module "load-balancer" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/services/QA/openshift"

  cluster_name          = "dotgroup-okd3-qa"
  name                  = "okd3-qa-lb"
  key_name              = "default_qa"
  instance_count        = 1
  instance_type         = "t2.medium"
  main_disk_size        = 20
  subnet_id = "subnet-095d49c9099bc0bd9"
  vpc_security_group_ids = ["sg-01d95825bef0e33c1"]
}
