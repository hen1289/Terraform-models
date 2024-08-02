module "redis" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/data-stores/redis"

  name     = "redis-qa"
  key_name = "default_qa"
  instance_type = "t3.medium"
}
