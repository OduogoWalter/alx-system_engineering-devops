#!/usr/bin/env bash
# This script sets up a database and a table with an entry, and grants necessary permissions

# MySQL root user and password
MYSQL_ROOT_USER='root'
MYSQL_ROOT_PASSWORD='your_root_password'

# Database and table details
DATABASE_NAME='tyrell_corp'
TABLE_NAME='nexus6'
USER_TO_GRANT='holberton_user'

# Command to log into MySQL as root
MYSQL_LOGIN="mysql -u$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD"

# Create database, table, add an entry, and grant permissions
$MYSQL_LOGIN <<EOF
CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;
USE $DATABASE_NAME;
CREATE TABLE IF NOT EXISTS $TABLE_NAME (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);
INSERT INTO $TABLE_NAME (name) VALUES ('Leon');
GRANT SELECT ON $DATABASE_NAME.$TABLE_NAME TO '$USER_TO_GRANT'@'localhost';
FLUSH PRIVILEGES;
EOF
