#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Execute este script com sudo."
    exit 1
fi



set -e

echo "Iniciando provisionamento do servidor Apache..."

echo "Atualizando a lista de pacotes..."
apt update

echo "Instalando atualizações do sistema..."
apt upgrade -y

echo "Instalando o Apache2"
apt install apache2 -y

echo "Instalando o Unzip..."
apt install unzip -y

echo "Removendo arquivo ZIP anterior..."
rm -f /tmp/main.zip

echo "Baixando a aplicação do GitHub..."
wget -O /tmp/main.zip https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

echo "Extraindo os arquivos da aplicação..."
unzip -o /tmp/main.zip -d /tmp

echo "Copiando os arquivos para o Apache..."
cp -r /tmp/linux-site-dio-main/. /var/www/html/

echo "Iniciando o serviço Apache..."

systemctl enable apache2
systemctl restart apache2




