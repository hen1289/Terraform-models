Terraform Modules
=================

O objetivo deste repositório é manter e enriquecer a estrutura modular de IAC no **DOT digital group** com a utilização do Terraform. Atualmente temos módulos para os seguintes providers:

- AWS
- VMware Vsphere

Utilização
----------

Para utilizar o módulo basta incluí-lo no `.tf` desejado e informar as variáveis:

```
module "modulename" {
  source = "git::git@bitbucket.org:dotgroup/terraform-modules.git//vendor/module-name?ref=v0.1.0"

  var1 = "1234"
  var2 = "ABCD"
}
```