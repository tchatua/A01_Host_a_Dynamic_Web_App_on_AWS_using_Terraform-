# Create a launch template
# Terraform aws launch template
resource "aws_launch_template" "webserver_launch_template" {
  name          = "${var.name}-webserver-launch-template"
  image_id      = var.ec2_image_id_webserver
  instance_type = var.ec2_instance_type_webserver
  key_name      = var.key_name_webserver
  description   = var.description_webserver

  monitoring {
    enabled = var.enables_monitoring
  }

  vpc_security_group_ids = [aws_security_group.webserver_security_group.id]

  tags = {
    Name          = "${var.name}-webserver-launch-template"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}

# Create Auto Scaling Group 
# Terraform aws auto scaling group 
resource "aws_autoscaling_group" "auto_scaling_group" {
  name                = "${var.name}-webserver-asg"
  max_size            = var.max_size_webserver_asg
  min_size            = var.min_size_webserver_asg
  health_check_type   = var.health_check_type_webserver_asg
  desired_capacity    = var.desired_capacity_webserver_asg
  vpc_zone_identifier = [aws_subnet.private_app_subnet_az1.id, aws_subnet.private_app_subnet_az2.id]

  launch_template {
    name    = aws_launch_template.webserver_launch_template.name
    version = var.version_launch_template
  }

  tag {
    key                 = var.key_tag
    value               = var.value_tag
    propagate_at_launch = var.propagate_at_launch_tag
  }

  lifecycle {
    ignore_changes = [target_group_arns]
  }
}

# Attach auto scaling group to alb target group
# Terraform aws auto scaling attachment
resource "aws_autoscaling_attachment" "asg_alb_target_group_attachment" {
  autoscaling_group_name = aws_autoscaling_group.auto_scaling_group.id
  lb_target_group_arn    = aws_lb_target_group.alb_target_group.arn
}

# Create auto scaling group notification
# Terraform aws auto scaling notification
resource "aws_autoscaling_notification" "webserver_asg_notifications" {
  group_names = [aws_autoscaling_group.auto_scaling_group.name]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.user_updates.arn
}