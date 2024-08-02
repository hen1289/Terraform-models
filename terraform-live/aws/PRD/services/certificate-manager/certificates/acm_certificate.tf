module "certificate4clients" {
  source         = "git::git@github.com:dotdigitalgroup/terraform-modules.git//aws/services/certificate-manager"
  clients        = var.clients
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
}
output "DNS-records" {
  value = module.certificate4clients.DNS-records
}