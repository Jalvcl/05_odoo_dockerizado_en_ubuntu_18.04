#!/bin/bash
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
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt update
apt-cache policy docker-ce
apt install docker-ce
systemctl status docker
usermod -a -G docker $USER

#Instalación iTerm integración shell
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash