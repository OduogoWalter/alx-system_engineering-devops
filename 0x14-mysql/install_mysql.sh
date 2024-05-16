#!/usr/bin/env bash
# This script installs MySQL 5.7.x on web-01 and web-02 servers

# Update package lists
sudo apt update

# Install MySQL 5.7.x
sudo apt install mysql-server -y

# Verify MySQL installation
mysql --version

# Check MySQL service status
sudo systemctl status mysql
