#!/bin/bash
# Flyway CLI tool documentation:
# URL: https://documentation.red-gate.com/fd/command-line-184127404.html?_ga=2.227219800.439967574.1689438755-1087648319.1689438670

# This script that enables the migration of SQL data into an RDS database with Flyway

# Variables
S3_URI=s3://dwa-project-web-files-052420240804/V1__shopwise.sql
RDS_ENDPOINT=dev-dwa-rds-database.cqzs0k7m1d1u.us-east-1.rds.amazonaws.com
RDS_DB_NAME=dwaappdatabase
RDS_DB_USERNAME=tchatua
RDS_DB_PASSWORD=tchatua123

# Update all packages
sudo yum update -y

# Download and extract Flyway
sudo wget -qO- https://download.red-gate.com/maven/release/com/redgate/flyway/flyway-commandline/10.9.1/flyway-commandline-10.9.1-linux-x64.tar.gz | tar -xvz 

# Create a symbolic link to make Flyway accessible globally
sudo ln -s $(pwd)/flyway-10.9.1/flyway /usr/local/bin

# Create the SQL directory for migrations
sudo mkdir sql

# Download the migration SQL script from AWS S3
sudo aws s3 cp "$S3_URI" sql/

# Run Flyway migration
flyway -url=jdbc:mysql://"$RDS_ENDPOINT":3306/"$RDS_DB_NAME" \
  -user="$RDS_DB_USERNAME" \
  -password="$RDS_DB_PASSWORD" \
  -locations=filesystem:sql \
  migrate


