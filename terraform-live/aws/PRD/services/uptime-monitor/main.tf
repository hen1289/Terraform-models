module "uptime-monitor" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//aws/services/uptime-monitor"

  name     = "uptime-monitor"
  key_name = "default_prd"
  instance_type = "t2.micro"
}
