module "cf_distributions4clients" {
  source         = "git::git@github.com:dotdigitalgroup/terraform-modules.git//aws/services/cloudfront/distributions"
  clients        = var.clients
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
}
output "Distributions" {
  value = module.cf_distributions4clients.Distributions
}