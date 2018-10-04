# Odoo Dockerizado corriendo en Ubuntu Server

## 1.- Instalación Ubuntu Server

basado en el tutorial de digital ocean para la instalación de servidor ubuntu 18.04 LTS *(bionic)*
 <https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04>

Durante la instalación se eligieron instalar, PostgreSQL, docker, prometheus, wekan

### 1.1.- Preparación del Servidor

#### Realizar upgrade de Ubuntu

`sudo apt-get upgrade -y`

#### Ajustar la zona horaria a la región correcta

`sudo dpkg-reconfigure tzdata`

#### Editar la lista de repositorios para agregar "mirrors" cercanos tu ubicación geográfica

esto permite acelerar las actualizaciones e intalaciones asi como aprovechar de agregar repositorios extras.

`sudo nano /etc/apt/sources.list`

copiar y pegar los textos

```bash
deb http://archive.ubuntu.com/ubuntu bionic main universe
deb http://archive.ubuntu.com/ubuntu bionic-security main universe
deb http://archive.ubuntu.com/ubuntu bionic-updates main universe
deb mirror://mirrors.ubuntu.com/mirrors.txt bionic main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-backports main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-security main restricted universe multiverse
```

grabar presionando ctrl+o, salir presionando tecla ctrl+x

#### Habilitar el firewall

`sudo ufw app list`

resultado:

```bash
Available applications:
  OpenSSH
```

ejecutar
`sudo ufw allow OpenSSH`

resultado:

```sh
Rules updated
Rules updated (v6)
```

ejecutar
`sudo ufw enable`

resultado:

```bash
Command may disrupt existing ssh connections. Proceed with operation (y|n)? y
Firewall is active and enabled on system startup
````

repetir este procedimiento para todas las aplicaciones que desees permitir acceso

## 1.2.- Preparación de Docker

Durante la instalación de Ubuntu 18.04 LTS se eligió habilitar docker, si esto no se hizo durante la instalación, puedes instalarlo siguiedo este tutorial.

<https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04>

#### Agregar al usuario actual al grupo Docker

`sudo usermod -a -G docker $USER`

### Instalar algunos paquetes necesarios

`sudo apt update -y && sudo apt install apt-transport-https ca-certificates curl software-properties-common -y`
