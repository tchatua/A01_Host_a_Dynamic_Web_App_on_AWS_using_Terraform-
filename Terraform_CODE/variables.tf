# General Variables
variable "name" {}
variable "folder" {}
variable "author" {}
variable "project" {}
variable "managedby" {}
variable "owner" {}
variable "administrator" {}

# Region
variable "region" {}
variable "profile" {}

# vpc
variable "cidr_block_vpc" {}
variable "instance_tenancy" {}
variable "enable_dns_hostnames" {}

# Public Subnet az1
variable "cidr_block_public_subnet_az1" {}
variable "availability_zone_1" {}
variable "map_public_ip_on_launch_yes" {}

# Public Subnet az2
variable "cidr_block_public_subnet_az2" {}
variable "availability_zone_2" {}

# public_route_table
variable "cidr_block_public_route_table" {}

# private_app_subnet_az1
variable "cidr_block_private_app_subnet_az1" {}
variable "map_public_ip_on_launch_no" {}

# private_app_subnet_az2
variable "cidr_block_private_app_subnet_az2" {}

# private_data_subnet_az1
variable "cidr_block_private_data_subnet_az1" {}

# private_data_subnet_az1
variable "cidr_block_private_data_subnet_az2" {}

# NAT Gateway
variable "domain" {}

# private_route_table_az1
variable "cidr_block_private_route_table_az1" {}

# private_route_table_az2
variable "cidr_block_private_route_table_az2" {}

# alb_security_group
variable "description_alb_security_group" {}
# ingress http access
variable "description_ingress_http_access" {}
variable "http_port" {}
variable "tcp_protocol" {}
variable "anywhere" {}
# ingress https access
variable "description_ingress_https_access" {}
variable "https_port" {}
# egress alb sg
variable "zero" {}
variable "minus_one" {}

# ssh_security_group
variable "description_ssh_security_group" {}
variable "description_ingress_ssh_access" {}
variable "ssh_port" {}
variable "my_ip_address" {}

# webserver_security_group
variable "description_webserver_security_group" {}

# database_security_group
variable "description_database_security_group" {}
variable "description_ingress_database_access" {}
variable "mysql_port" {}

