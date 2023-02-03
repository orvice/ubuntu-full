#!/usr/bin/env bash
set -ex

echo "Update"
apt-get update 

echo "Install curl wget gnupg2 ca-certificates"
apt-get install -y git unzip curl wget gnupg2 ca-certificates sudo

echo "Install Mysql Client"
apt-get install -y default-mysql-client

echo "Install postgresql-client"
apt-get install -y postgresql-client

echo "Intall rclone"
curl https://rclone.org/install.sh | bash

echo "Install mongo"
curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc |  apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" |  tee /etc/apt/sources.list.d/mongodb-org-4.4.list

apt-get update && apt-get install -y mongodb-org-shell


# azure cli
echo "Install azure cli"
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
sudo apt-get update
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg

sudo mkdir -p /etc/apt/keyrings
curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

AZ_REPO=$(lsb_release -cs)
echo "deb [arch=`dpkg --print-architecture` signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list

sudo apt-get update
sudo apt-get install azure-cli