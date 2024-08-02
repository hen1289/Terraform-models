module "load-balancer" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/services/openshift"

  cluster_name          = "dotgroup-okd3-hom"
  name                  = "okd3-hom-lb"
  key_name              = "default_hom"
  instance_count        = 1
  instance_type         = "t2.medium"
  main_disk_size        = 20
  is_load_balancer      = true
  vpc_security_group_ids = ""
  subnet_id = ""
}
