#!/bin/bash

# Criar um ponto de montagem e montar a partição
mkdir /var/lib/docker
mount /dev/nvme1n1p1 /var/lib/docker
echo "/dev/nvme1n1p1  /var/lib/docker xfs defaults  0 0" | tee -a /etc/fstab


# Adicionar o repositório do Docker
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo


# Instalar dependências do Docker
dnf install -y yum-utils device-mapper-persistent-data lvm2 

# Instalar o Docker
dnf install -y docker-ce docker-ce-cli containerd.io

# Habilitar o serviço do Docker na inicialização do sistema
systemctl enable docker

# Iniciar o serviço do Docker
systemctl start docker
usermod -a -G docker rocky

cat <<EOF > /home/rocky/.ssh/id_rsa
${ssh-key}
EOF
chmod 600 /home/rocky/.ssh/id_rsa

git clone git@github.com:dotdigitalgroup/registry.git /home/rocky/registry
chown -R rocky:rocky /home/rocky/registry