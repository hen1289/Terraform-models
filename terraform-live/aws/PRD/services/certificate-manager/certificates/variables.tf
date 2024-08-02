variable "clients" {
  description = "Lista de clientes com seus dados para geração dos certificados"
  type = list(object({
    client_name = string
    domains     = list(string)
    root_domain = string
    tags = object({
      Name   = string
      client = string
      usage  = string
    })
  }))

  default = [
    {
      client_name = "Cliente1"
      domains     = ["example1.com", "example2.com"]
      root_domain = "string"
      tags = {
        Name   = ""
        client = ""
        usage  = "AWS_CF_WAF"
      }
    }
  ]
}
variable "aws_access_key" {
  sensitive = true
  type      = string
  default   = ""

}

variable "aws_secret_key" {
  sensitive = true
  type      = string
  default   = ""
}
