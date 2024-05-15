#!/usr/bin/env bash
# This script installs MySQL 5.7 on an Ubuntu 16.04 server

# Update package lists
sudo apt-get update

# Install the required package for adding a repository
sudo apt-get install -y software-properties-common

# Add the MySQL repository
sudo add-apt-repository -y "deb http://repo.mysql.com/apt/ubuntu/ $(lsb_release -sc) mysql-5.7"

# Update package lists after adding MySQL repository
sudo apt-get update

# Install MySQL 5.7
sudo apt-get install -y mysql-server-5.7

# Check MySQL version to confirm the installation
mysql --version
