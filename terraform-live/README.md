Terraform Live
==============

O objetivo deste repositório é guardar toda a infraestrutura provisionada nos ambientes. As configurações executadas aqui devem instanciar os módulos presentes no [terraform-modules](https://bitbucket.org/dotgroup/terraform-modules/). Atualmente temos o estado do provisionamento dos seguintes providers:

- AWS
- VMware Vsphere

Utilização com AWS
------------------

Para a utilização com AWS, a autenticação é feita através de variáveis de ambiente ou por um arquivo de credenciais. [Consulte a documentação](https://www.terraform.io/docs/providers/aws/index.html#authentication) para realizar esta configuração.

Exemplo utilizando variáveis de ambiente:

```sh
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_DEFAULT_REGION="us-east-1"

terraform plan
```

Utilização com o VMware (Lumen)
-------------------------------

Se for utilizar o VMware, você deve especificar algumas variáveis. Veja o exemplo do comando `plan` com valores fictícios:

```
$ terraform plan \
    -var vsphere_password='vsphere_password' \
    -var public_key_path='/path/to/public/key/file' \
    -var vm_root_password='root_password'
```
