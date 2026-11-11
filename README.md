# Provisionamento de Servidor Web Apache

## Sobre o projeto

Projeto desenvolvido como desafio prático de Infraestrutura como Código (IaC), proposto pela DIO.

O objetivo é automatizar o provisionamento de um servidor web Apache utilizando um script Bash no Ubuntu.

## Tecnologias utilizadas

- Ubuntu Linux
- Bash
- Apache2
- Unzip
- Git e GitHub
- Oracle VirtualBox

## Etapas do projeto

### 1. Atualização do sistema

Atualização da lista de pacotes e instalação das atualizações disponíveis.

```bash
sudo apt update
sudo apt upgrade -y
```

### 2. Instalação do Apache2

Instalação do servidor web Apache.

```bash
sudo apt install apache2 -y
```

Verificação da versão:

```bash
apache2 -v
```

Verificação do serviço:

```bash
sudo systemctl status apache2
```

### 3. Instalação do Unzip

Instalação da ferramenta utilizada para extrair arquivos ZIP.

```bash
sudo apt install unzip -y
```

### 4. Download da aplicação

Download do projeto disponibilizado no GitHub para o diretório `/tmp`.

```bash
wget -P /tmp https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
```

### 5. Extração dos arquivos

```bash
unzip /tmp/main.zip -d /tmp
```

### 6. Cópia dos arquivos para o Apache

Cópia dos arquivos da aplicação para o diretório padrão do Apache.

```bash
sudo cp -r /tmp/linux-site-dio-main/. /var/www/html/
```

### 7. Verificação do servidor

Consulta do endereço IP do servidor:

```bash
hostname -I
```

A aplicação pode ser acessada pelo navegador utilizando o endereço IP do Ubuntu.

Exemplo:

```text
http://192.168.1.10
```

## Script de provisionamento

O arquivo `provisionar-apache.sh` automatiza as etapas do projeto.

### Código completo

```bash
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

echo "Instalando o Apache2..."
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
```

## Como executar o script

Conceder permissão de execução:

```bash
chmod +x provisionar-apache.sh
```

Executar com privilégios de administrador:

```bash
sudo ./provisionar-apache.sh
```

## Conceitos aprendidos

- Infraestrutura como Código (IaC).
- Automação com scripts Bash.
- Atualização e gerenciamento de pacotes no Ubuntu.
- Instalação e gerenciamento do Apache2.
- Download e extração de arquivos.
- Gerenciamento de serviços com `systemctl`.
- Permissões e execução de scripts.
- Versionamento de código com Git e GitHub.

## Autor

Israel

Projeto desenvolvido para fins de estudo e prática em Infraestrutura como Código (IaC), como parte dos desafios da DIO.