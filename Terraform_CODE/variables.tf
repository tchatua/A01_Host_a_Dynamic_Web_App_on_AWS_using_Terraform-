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
