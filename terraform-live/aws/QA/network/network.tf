module "network" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/services/network"

  vpc_name     = "default_qa"
  region       = "us-east-1"
  cluster_name = "dotgroup-okd3-qa"
  sg_name      = "sg_default_qa"
}