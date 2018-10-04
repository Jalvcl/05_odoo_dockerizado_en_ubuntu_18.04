#!/bin/bash

#Istalar utilizando comando 
# sudo curl -L https://raw.githubusercontent.com/Jalvcl/05_odoo_dockerizado_en_ubuntu_18.04/master/installserver.sh | sudo bash

#Habilitación zona de tiempo correcta
export TZ=America/Santiago
#Agregar repositorios extras y mirror locales
cat > /etc/apt/sources.list <<EOF
deb http://archive.ubuntu.com/ubuntu bionic main universe restricted multiverse
deb http://archive.ubuntu.com/ubuntu bionic-security main universe restricted multiverse
deb http://archive.ubuntu.com/ubuntu bionic-updates main universe restricted multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt bionic main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-backports main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-security main restricted universe multiverse
EOF
apt update && apt upgrade -y
apt install apt-transport-https ca-certificates curl software-properties-common -y

#Instalación Docker
addgroup --system docker
adduser $USER docker
newgrp docker
snap install docker
systemctl status docker

#Instalación iTerm integración shell
#curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

#Reiniciar para que lso cambios tomen efecto
#shutdown -r