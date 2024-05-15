#!/usr/bin/env bash
# This script creates a replica user and grants necessary permissions

# MySQL root user and password
MYSQL_ROOT_USER='root'
MYSQL_ROOT_PASSWORD='your_root_password'

# Replica user details
REPLICA_USER='replica_user'
REPLICA_PASSWORD='your_replica_password'  # Replace with your desired password

# Holberton user for permission verification
HOLBERTON_USER='holberton_user'

# Command to log into MySQL as root
MYSQL_LOGIN="mysql -u$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD"

# Create replica user, grant permissions, and ensure holberton_user can verify
$MYSQL_LOGIN <<EOF
CREATE USER IF NOT EXISTS '$REPLICA_USER'@'%' IDENTIFIED BY '$REPLICA_PASSWORD';
GRANT REPLICATION SLAVE ON *.* TO '$REPLICA_USER'@'%';
GRANT SELECT ON mysql.user TO '$HOLBERTON_USER'@'localhost';
FLUSH PRIVILEGES;
EOF
