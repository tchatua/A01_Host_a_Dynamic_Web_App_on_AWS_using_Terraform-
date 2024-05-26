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

# # RDS Variables
# # database_subnet_group
# variable "description_database_subnets_group" {}
# # latest_db_snapshot
# variable "database_snapshot_identifier" {}
# variable "most_recent_latest_db_snapshot" {}
# variable "snapshot_type_latest_db_snapshot" {}
# # database_instance
# variable "database_instance_class" {}
# variable "skip_final_snapshot_database_instance" {}
# variable "database_instance_identifier" {}
# variable "multi_az_deployment" {}

# application_load_balancer
variable "internal_false" {}
variable "load_balancer_type" {}
variable "enable_deletion_protection_false" {}

# alb_target_group
variable "target_type" {}
variable "http_protocol" {}
variable "healthy_threshold_alb_target_group" {}
variable "matcher_alb_target_group" {}
variable "path_alb_target_group" {}
variable "port_health_check_alb_target_group" {}
variable "timeout_alb_target_group" {}
variable "unhealthy_threshold_alb_target_group" {}

# alb_http_listener on port 80
variable "type_alb_http_listener" {}
# redirect
variable "host_redirect" {}
variable "path_redirect" {}
variable "https_protocol" {}
variable "status_code_redirect_alb_http_listener" {}

# alb_http_listener on port 443
variable "ssl_policy" {}
variable "ssl_certificate_arn" {}
variable "type_alb_https_listener" {}

# aws_sns_topic_subscription
variable "protocol_sns" {}
variable "operator_email_sns" {}

# aws_launch_template webserver_launch_template
variable "ec2_image_id_webserver" {}
variable "ec2_instance_type_webserver" {}
variable "key_name_webserver" {}
variable "description_webserver" {}
variable "enables_monitoring" {}

# aws_autoscaling_group auto_scaling_group for webserver
variable "max_size_webserver_asg" {}
variable "min_size_webserver_asg" {}
variable "health_check_type_webserver_asg" {}
variable "desired_capacity_webserver_asg" {}
variable "version_launch_template" {}
# tag
variable "key_tag" {}
variable "value_tag" {}
variable "propagate_at_launch_tag" {}

# data "aws_route53_zone" "hosted_zone" 
variable "domain_name" {}

# aws_route53_record site_domain
variable "record_name" {}
variable "record_type" {}
variable "evaluate_target_health_record" {}




