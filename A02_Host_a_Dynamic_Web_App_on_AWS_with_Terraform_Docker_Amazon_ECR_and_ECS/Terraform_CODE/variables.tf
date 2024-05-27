# main
variable "region_to_create_resources" {}
# variable "profile" {}

# Environment variables
variable "automation" {}
variable "project_name" {}
variable "environment" {}
variable "name" {}
variable "folder" {}
variable "author" {}
variable "owner" {}
variable "administrator" {}
variable "description" {}

# create vpc
variable "cidr_block_vpc" {}
variable "instance_tenancy_vpc" {}
variable "enable_dns_hostnames_vpc" {}
# Create public subnet az1 
variable "cidr_block_public_subnet_az1" {}
variable "map_public_ip_on_launch_public_subnet" {}
# Create public subnet az2
variable "cidr_block_public_subnet_az2" {}
# Create route table and public route
variable "anywhere_on_the_internet" {}
# create private app subnet az1
variable "cidr_block_private_app_subnet_az1" {}
variable "map_public_ip_on_launch_private_subnet" {}
# create private app subnet az2
variable "cidr_block_private_app_subnet_az2" {}
# create private data subnet az1
variable "cidr_block_private_data_subnet_az1" {}
# create private data subnet az2
variable "cidr_block_private_data_subnet_az2" {}

# elastic IP az1
variable "domain_eip" {}

# Create security group for the application load balancer
# alb sg
variable "description_alb_security_group" {}
variable "description_ingress_http_access" {}
variable "description_ingress_https_access" {}
variable "http_port" {}
variable "https_port" {}
variable "tcp_protocol" {}
variable "zero" {}
variable "minus_one" {}
# Create security group for the bastion host aka jumb box
variable "description_bastion_security_group" {}
variable "description_ingress_ssh_access" {}
variable "ssh_port" {}
variable "ssh_location" {}
# Create security group for the app server
variable "description_app_server_security_group" {}
# Create security group for the database
variable "description_database_security_group" {}
variable "description_ingress_mysql_or_aurora_access" {}
variable "mysql_port" {}
variable "description_custom_access" {}




