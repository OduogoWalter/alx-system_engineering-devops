#!/usr/bin/env bash
# Script to install MySQL 5.7.x

# Update package index
sudo apt-get update

# Install MySQL Server 5.7.x
sudo apt-get install -y mysql-server

# Check MySQL version
mysql --version
