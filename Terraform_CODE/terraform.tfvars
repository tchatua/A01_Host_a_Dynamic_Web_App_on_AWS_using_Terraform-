# General Variables
name          = "dev-dwa"
folder        = "a02_2024/d14_AOSNOTE/A01_Host_a_Dynamic_Web_App_on_AWS_using_Terraform-/Terraform_CODE"
author        = ""
project       = "DWA: Host a Dynamic Web App on AWS Cloud Platformusing Terraform and EC2"
managedby     = "Terraform"
owner         = "Arristide Tchatua"
administrator = "tchattua@gmail.com, tchatuaa@gmail.com"

# Region
region  = "us-east-1"
profile = "tchatua"

# VPC
cidr_block_vpc       = "192.168.0.0/16"
instance_tenancy     = "default"
enable_dns_hostnames = true

# Public subnet az1
cidr_block_public_subnet_az1 = "192.168.10.0/24"
availability_zone_1          = "us-east-1a"
map_public_ip_on_launch_yes  = true

# Public Subnet az2
cidr_block_public_subnet_az2 = "192.168.20.0/24"
availability_zone_2          = "us-east-1b"

# public_route_table
cidr_block_public_route_table = "0.0.0.0/0"

# private_app_subnet_az1
cidr_block_private_app_subnet_az1 = "192.168.30.0/24"
map_public_ip_on_launch_no        = false

# private_app_subnet_az2
cidr_block_private_app_subnet_az2 = "192.168.40.0/24"

# private_data_subnet_az1
cidr_block_private_data_subnet_az1 = "192.168.50.0/24"

# private_data_subnet_az1
cidr_block_private_data_subnet_az2 = "192.168.60.0/24"

