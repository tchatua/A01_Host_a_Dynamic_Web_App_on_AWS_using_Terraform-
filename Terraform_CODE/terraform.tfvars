# General Variables
name          = "dev-dwa"
folder        = "a02_2024/d14_AOSNOTE/A01_Host_a_Dynamic_Web_App_on_AWS_using_Terraform-/Terraform_CODE"
author        = "Arristide Tchatua"
project       = "DWA: Host a Dynamic Web App on AWS Cloud Platformusing Terraform and EC2"
managedby     = "Terraform"
owner         = "Arristide Tchatua"
# administrator = "tchattua@gmail.com, tchatuaa@gmail.com"
administrator = "tchattua@gmail.com"

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

# NAT Gateway
domain = "vpc"

# private_route_table_az1
cidr_block_private_route_table_az1 = "0.0.0.0/0"

# private_route_table_az2
cidr_block_private_route_table_az2 = "0.0.0.0/0"

# alb_security_group
description_alb_security_group = "enable http/https access on port 80/443"
# ingress http access
description_ingress_http_access = "http access"
http_port                       = 80
tcp_protocol                    = "tcp"
anywhere                        = "0.0.0.0/0"
# ingress https access
description_ingress_https_access = "https access"
https_port                       = 443
# egress alb sg
zero      = 0
minus_one = -1

# ssh_security_group
description_ssh_security_group = "Enable ssh access on port 22"
# ingress
description_ingress_ssh_access = "ssh access"
ssh_port                       = 22
my_ip_address                  = "108.24.142.74/32"

# webserver_security_group
description_webserver_security_group = "enable http/https access on port 80/443 through ALB SG"

# database_security_group
description_database_security_group = "enable mysql/aurora access on port 3306 through the webserver sg"
description_ingress_database_access = "mysql/aurora access"
mysql_port                          = "3306"

# # RDS
# # database_subnet_group
# description_database_subnets_group = "subnets for database instance"
# # latest_db_snapshot
# database_snapshot_identifier     = "arn:aws:rds:us-east-1:088354478627:snapshot:fleetcart-final-snapshot"
# most_recent_latest_db_snapshot   = true
# snapshot_type_latest_db_snapshot = "manual"
# # database_instance
# database_instance_class               = "db.t2.micro"
# skip_final_snapshot_database_instance = true
# database_instance_identifier          = "database-1"
# multi_az_deployment                   = false

# application_load_balancer
internal_false                   = false
load_balancer_type               = "application"
enable_deletion_protection_false = false

# alb_target_group
target_type                          = "instance"
http_protocol                        = "HTTP"
healthy_threshold_alb_target_group   = 5
matcher_alb_target_group             = "200,301,302"
path_alb_target_group                = "/"
port_health_check_alb_target_group   = "traffic-port"
timeout_alb_target_group             = 5
unhealthy_threshold_alb_target_group = 2

# alb_http_listener on port 80
type_alb_http_listener = "redirect"
# redirect
host_redirect                          = "#{host}"
path_redirect                          = "/#{path}"
https_protocol                         = "HTTPS"
status_code_redirect_alb_http_listener = "HTTP_301"

# alb_https_listener on port 443
ssl_policy              = "ELBSecurityPolicy-2016-08"
ssl_certificate_arn     = "arn:aws:acm:us-east-1:088354478627:certificate/c7ffdb2a-91a1-40fc-b2fb-36cf6f2ab62a"
type_alb_https_listener = "forward"
