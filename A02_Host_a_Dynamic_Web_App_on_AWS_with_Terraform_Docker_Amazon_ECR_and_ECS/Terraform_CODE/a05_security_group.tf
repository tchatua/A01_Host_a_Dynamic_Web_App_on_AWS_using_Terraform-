# Create security group for the application load balancer
resource "aws_security_group" "alb_security_group" {
  name        = "${var.project_name}-${var.environment}-alb-sg"
  description = var.description_alb_security_group
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = var.description_ingress_http_access
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = var.tcp_protocol
    cidr_blocks = [var.anywhere_on_the_internet]
  }

  ingress {
    description = var.description_ingress_https_access
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = var.tcp_protocol
    cidr_blocks = [var.anywhere_on_the_internet]
  }

  egress {
    from_port   = var.zero
    to_port     = var.zero
    protocol    = var.minus_one
    cidr_blocks = [var.anywhere_on_the_internet]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-alb-sg"
  }
}
# Create security group for the bastion host aka jumb box
resource "aws_security_group" "bastion_security_group" {
  name        = "${var.project_name}-${var.environment}bastion-sg"
  description = var.description_bastion_security_group
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = var.description_ingress_ssh_access
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.tcp_protocol
    cidr_blocks = [var.ssh_location]
  }

  egress {
    from_port   = var.zero
    to_port     = var.zero
    protocol    = var.minus_one
    cidr_blocks = [var.anywhere_on_the_internet]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-bastion-sg"
  }
}

# Create security group for the app server
resource "aws_security_group" "app_server_security_group" {
  name        = "${var.project_name}-${var.environment}-app-server-sg"
  description = var.description_app_server_security_group
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = var.description_ingress_http_access
    from_port       = var.http_port
    to_port         = var.http_port
    protocol        = var.tcp_protocol
    security_groups = [aws_security_group.alb_security_group.id]
  }

  ingress {
    description     = var.description_ingress_https_access
    from_port       = var.https_port
    to_port         = var.https_port
    protocol        = var.tcp_protocol
    security_groups = [aws_security_group.alb_security_group.id]
  }

  egress {
    from_port   = var.zero
    to_port     = var.zero
    protocol    = var.minus_one
    cidr_blocks = [var.anywhere_on_the_internet]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-app-server-sg"
  }
}

# Create security group for the database
resource "aws_security_group" "database_security_group" {
  name        = "${var.project_name}-${var.environment}-database-sg"
  description = var.description_database_security_group
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = var.description_ingress_mysql_or_aurora_access
    from_port       = var.mysql_port
    to_port         = var.mysql_port
    protocol        = var.tcp_protocol
    security_groups = [aws_security_group.app_server_security_group.id]
  }

  ingress {
    description     = var.description_custom_access
    from_port       = var.mysql_port
    to_port         = var.mysql_port
    protocol        = var.tcp_protocol
    security_groups = [aws_security_group.bastion_security_group.id]
  }

  egress {
    from_port   = var.zero
    to_port     = var.zero
    protocol    = var.minus_one
    cidr_blocks = [var.anywhere_on_the_internet]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-database-sg"
  }
}
