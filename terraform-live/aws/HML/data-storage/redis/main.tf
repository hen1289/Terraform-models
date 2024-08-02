module "redis" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/data-stores/redis"

  name     = "redis-hom"
  key_name = "default_hom"
  instance_type = "t3.medium"
}
