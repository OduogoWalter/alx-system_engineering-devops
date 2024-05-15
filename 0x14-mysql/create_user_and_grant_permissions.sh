#!/usr/bin/env bash
# This script creates a MySQL user and grants the necessary permissions for replication status checks

# MySQL root user and password
MYSQL_ROOT_USER='root'
MYSQL_ROOT_PASSWORD='your_root_password'

# New user details
NEW_USER='holberton_user'
NEW_PASSWORD='projectcorrection280hbtn'

# Command to log into MySQL as root
MYSQL_LOGIN="mysql -u$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD"

# Create a new user and grant permissions
$MYSQL_LOGIN <<EOF
CREATE USER IF NOT EXISTS '$NEW_USER'@'localhost' IDENTIFIED BY '$NEW_PASSWORD';
GRANT REPLICATION CLIENT ON *.* TO '$NEW_USER'@'localhost';
FLUSH PRIVILEGES;
EOF
