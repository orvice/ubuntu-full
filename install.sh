#!/usr/bin/env bash

echo "Update"
apt-get update 

echo "Install unzip curl wget "
apt-get install -y unzip curl wget

echo "Install Mysql Client"
apt-get install -y default-mysql-client

echo "Intall rclone"
curl https://rclone.org/install.sh | bash