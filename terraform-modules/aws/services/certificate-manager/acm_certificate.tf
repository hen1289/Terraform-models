# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "arn:aws:acm:us-east-1:586183866151:certificate/646f31ba-8f91-4e31-9b5c-27140dffc8e4"
resource "aws_acm_certificate" "main" {
  for_each                  = { for client in var.clients : client.client_name => client }
  certificate_authority_arn = null
  certificate_body          = null
  certificate_chain         = null
  domain_name               = each.value.root_domain
  early_renewal_duration    = null
  key_algorithm             = "RSA_2048"
  private_key               = null # sensitive
  subject_alternative_names = each.value.domains
  tags                      = each.value.tags
  tags_all = {
    Project = "AWS_CF_WAF"
  }
  validation_method = "DNS"
  options {
    certificate_transparency_logging_preference = "ENABLED"
  }
}

output "DNS-records" {
  value = {
    certs = [for key, cert in aws_acm_certificate.main : {
      client      = key
      validations = cert.domain_validation_options
      arn         = cert.id
      }
    ]
  }
}
