#!/bin/bash
set -x #echo on

#Instalar utilizando comando
# sudo curl -L https://raw.githubusercontent.com/Jalvcl/05_odoo_dockerizado_en_ubuntu_18.04/master/installserver.sh | bash

#Habilitación zona de tiempo correcta
export TZ=America/Santiago
#Agregar repositorios extras y mirror locales
sudo cat >/etc/apt/sources.list <<EOF
deb http://archive.ubuntu.com/ubuntu bionic main universe restricted multiverse
deb http://archive.ubuntu.com/ubuntu bionic-security main universe restricted multiverse
deb http://archive.ubuntu.com/ubuntu bionic-updates main universe restricted multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt bionic main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-backports main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-security main restricted universe multiverse
EOF
sudo apt update && sudo apt upgrade -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

#Instalación Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo systemctl status docker
sudo usermod -aG docker ${SUDO_USER}
# su - ${SUDO_USER}
# id -nG
docker run hello-world

#Instalación iTerm integración shell
#curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

#Reiniciar para que lso cambios tomen efecto
#shutdown -r
