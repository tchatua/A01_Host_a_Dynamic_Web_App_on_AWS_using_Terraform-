# main
region_to_create_resources = "us-east-1"
# profile = "tchatua"


# Environment variables
automation    = "Terraform"
project_name  = "dwa-ecs"
environment   = "dev"
name          = "dwa-ecs"
folder        = "a02_2024/d14_AOSNOTE/A01_Host_a_Dynamic_Web_App_on_AWS_using_Terraform-/Terraform_CODE"
author        = "Arristide Tchatua"
owner         = "Arristide Tchatua"
administrator = "tchattua@gmail.com"
description   = "Host a Dynamic Web App on AWS Cloud Platformusing Terraform and EC2"

# create vpc
cidr_block_vpc           = "192.168.0.0/16"
instance_tenancy_vpc     = "default"
enable_dns_hostnames_vpc = true
# Create public subnet az1 
cidr_block_public_subnet_az1          = "192.168.10.0/24"
map_public_ip_on_launch_public_subnet = true
# Create public subnet az2 
cidr_block_public_subnet_az2 = "192.168.20.0/24"
# Create route table and public route
anywhere_on_the_internet = "0.0.0.0/0"
# create private app subnet az1
cidr_block_private_app_subnet_az1      = "192.168.30.0/24"
map_public_ip_on_launch_private_subnet = false
# create private app subnet az2
cidr_block_private_app_subnet_az2 = "192.168.40.0/24"
# create private data subnet az1
cidr_block_private_data_subnet_az1 = "192.168.50.0/24"
# create private data subnet az2
cidr_block_private_data_subnet_az2 = "192.168.60.0/24"

# NAT Gateway
# elastic IP az1
domain_eip = "vpc"

# Security Groups Variables
# Create security group for the application load balancer
# alb sg
description_alb_security_group   = "enable http/https access on port 80/443"
description_ingress_http_access  = "http access"
description_ingress_https_access = "https access"
http_port                        = 80
https_port                       = 443
tcp_protocol                     = "tcp"
zero                             = 0
minus_one                        = -1
# Create security group for the bastion host aka jumb box
description_bastion_security_group = "enable http/https access on port 22"
description_ingress_ssh_access     = "ssh access"
ssh_port                           = 22
ssh_location                       = "108.24.142.74/32"
# Create security group for the app server
description_app_server_security_group = "enable http/https access on port 80/443 vis alb sg"
# Create security group for the database
description_database_security_group        = "enable mysql/aurora access on port 3306 vis app server sg"
description_ingress_mysql_or_aurora_access = "mysql/aurora access"
mysql_port                                 = 3306
description_custom_access                  = "custom access"

# Create RDS Database from the available snapshot
# Create database subnet group
description_database_subnet_group = "Subnets for database instances"
# Get information about a database snapshot 
db_snapshot_identifier_database_snapshot = ""
most_recent_database_snapshot            = true
snapshot_type_database_snapshot          = "manual"

# Launch an rds instance from a database snapshot
database_instance_class       = "db.t2.micro"
snapshot_of_database_instance = "dwa-ecs-dev-final-snapshot"
database_instance_identifier  = "dwa-dev-rds-db"
multi_az_deployment           = "false"
