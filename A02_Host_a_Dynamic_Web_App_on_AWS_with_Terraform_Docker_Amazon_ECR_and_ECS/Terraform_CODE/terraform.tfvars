# main
region_to_create_resources = "us-east-1"
# profile = "tchatua"


# Environment variables
automation   = "Terraform"
project_name = "dwa-ecs"
environment  = "dev"
name   = "dwa-ecs"
folder = "a02_2024/d14_AOSNOTE/A01_Host_a_Dynamic_Web_App_on_AWS_using_Terraform-/Terraform_CODE"
author = "Arristide Tchatua"
owner  = "Arristide Tchatua"
administrator = "tchattua@gmail.com"
description ="Host a Dynamic Web App on AWS Cloud Platformusing Terraform and EC2"

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

