module "redis" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/data-stores/redis"

  name     = "redis"
  key_name = "default_prd"
}
