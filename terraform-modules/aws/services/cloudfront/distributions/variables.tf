variable "clients" {
  description = "Lista de clientes com suas respectivas configurações"
  type = list(object({
    client_name       = string
    domains           = list(string)
    root_domain       = string
    comment = string
    acl_id            = string
    certificate_arn   = string
    allowed_locations = list(string)
    origin = object({
      domain = string
      name   = string
    })
    tags = object({
      client = string
      usage  = string
    })
  }))

  default = [
    {
      client_name       = "Cliente1"
      domains           = ["example1.com", "example2.com"]
      root_domain       = ""
      comment = ""
      acl_id            = "arn:aws:wafv2:us-east-1:586183866151:global/webacl/CreatedByCloudFront-f8122de3-5b2d-423d-acad-70f868488645/270ca17a-3a9d-4e52-99d7-d7d095e31c2a"
      certificate_arn   = "arn:aws:acm:region:account-id:certificate/certificate-id"
      allowed_locations = ["us-west-1", "us-east-1"]
      origin = {
        domain = "origin1.example.com"
        name   = "Origin1"
      }
      tags = {
        client = ""
        usage  = "AWS_CF_WAF"
      }
    }
  ]
}

variable "aws_access_key" {
  sensitive = true
  type = string
  default = ""
  
}

variable "aws_secret_key" {
  sensitive = true
  type = string
  default = ""
}

variable "cache_policy" {
  description = "Política de cache a ser vinculada. Default = CachingDisabled"
  default     = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
  type        = string
}

variable "origin_request_policy" {
  description = "Política de requisição para origem a ser vinculada. Default = DOT-All"
  default     = "d5c08828-716e-4068-85e6-51d01ecec838"
  type        = string
}