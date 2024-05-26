# Create ALB
# Terraform aws create application load balancer
resource "aws_lb" "application_load_balancer" {
  name               = "${var.name}-alb"
  internal           = var.internal_false
  load_balancer_type = var.load_balancer_type
  security_groups    = [aws_security_group.alb_security_group.id]

  subnet_mapping {
    subnet_id = aws_subnet.public_subnet_az1.id
  }

  subnet_mapping {
    subnet_id = aws_subnet.public_subnet_az2.id
  }

  enable_deletion_protection = var.enable_deletion_protection_false

  tags = {
    Name          = "${var.name}-alb"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }

  # access_logs {
  #     bucket  = aws_s3_bucket.lb_logs.id
  #     prefix  = "test-lb"
  #     enabled = true
  #   }
}

# Create target group
# Terraform aws create target group
resource "aws_lb_target_group" "alb_target_group" {
  name        = "${var.name}-alb-target-group"
  target_type = var.target_type
  port        = var.http_port
  protocol    = var.http_protocol
  vpc_id      = aws_vpc.vpc.id

  health_check {
    healthy_threshold   = var.healthy_threshold_alb_target_group
    matcher             = var.matcher_alb_target_group
    path                = var.path_alb_target_group
    port                = var.port_health_check_alb_target_group
    protocol            = var.http_protocol
    timeout             = var.timeout_alb_target_group
    unhealthy_threshold = var.unhealthy_threshold_alb_target_group
  }
}

# Create a listener on port 80 with forward action
# Terraform aws create listener
resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = var.http_port
  protocol          = var.http_protocol

  default_action {
    type = var.type_alb_http_listener

    redirect {
      host        = var.host_redirect
      path        = var.path_redirect
      port        = var.https_port
      protocol    = var.https_protocol
      status_code = var.status_code_redirect_alb_http_listener
    }
  }
}

# Create a listener on port 443 with forward action
# Terraform aws cretes listener
resource "aws_lb_listener" "alb_https_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = var.https_port
  protocol          = var.https_protocol
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.ssl_certificate_arn

  default_action {
    type             = var.type_alb_https_listener
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}
