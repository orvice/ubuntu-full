#!/usr/bin/env bash
set -ex

echo "Update"
apt-get update 

echo "Install curl wget gnupg2 ca-certificates"
apt-get install -y git unzip curl wget gnupg2 ca-certificates

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