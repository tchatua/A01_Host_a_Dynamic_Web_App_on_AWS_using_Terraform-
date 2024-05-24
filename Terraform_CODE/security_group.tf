# Create security group for the application load balancer 
# Terraform aws create security group
resource "aws_security_group" "alb_security_group" {
  name        = "${var.name}-alb-security-group"
  description = var.description_alb_security_group
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name          = "${var.name}-alb-security-group"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }

  ingress {
    description = var.description_ingress_http_access
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = var.tcp_protocol
    cidr_blocks = [var.anywhere]
  }

  ingress {
    description = var.description_ingress_https_access
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = var.tcp_protocol
    cidr_blocks = [var.anywhere]
  }

  egress {
    from_port   = var.zero
    to_port     = var.zero
    protocol    = var.minus_one
    cidr_blocks = [var.anywhere]
  }
}

# Create security group for the bastion host
# Terraform aws create security group
resource "aws_security_group" "ssh_security_group" {
  name        = "${var.name}-ssh-security-group"
  description = var.description_ssh_security_group
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name          = "${var.name}-ssh-security-group"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }

  ingress {
    description = var.description_ingress_ssh_access
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.tcp_protocol
    cidr_blocks = [var.my_ip_address]
  }


  egress {
    from_port   = var.zero
    to_port     = var.zero
    protocol    = var.minus_one
    cidr_blocks = [var.anywhere]
  }
}

# Create security group for the webserver
# Terraform aws create security group
resource "aws_security_group" "webserver_security_group" {
  name        = "${var.name}-webserver-security-group"
  description = var.description_webserver_security_group
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name          = "${var.name}-webserver-security-group"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }

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

  ingress {
    description     = var.description_ingress_ssh_access
    from_port       = var.ssh_port
    to_port         = var.ssh_port
    protocol        = var.tcp_protocol
    security_groups = [aws_security_group.ssh_security_group.id]
  }

  egress {
    from_port   = var.zero
    to_port     = var.zero
    protocol    = var.minus_one
    cidr_blocks = [var.anywhere]
  }
}

# Create security group for database
# Terraform aws create security group
resource "aws_security_group" "database_security_group" {
  name        = "${var.name}-database-security-group"
  description = var.description_database_security_group
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name          = "${var.name}-database-security-group"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }

  ingress {
    description     = var.description_ingress_database_access
    from_port       = var.mysql_port
    to_port         = var.mysql_port
    protocol        = var.tcp_protocol
    security_groups = [aws_security_group.webserver_security_group.id]
  }

  ingress {
    description     = var.description_ingress_ssh_access
    from_port       = var.ssh_port
    to_port         = var.ssh_port
    protocol        = var.tcp_protocol
    security_groups = [aws_security_group.ssh_security_group.id]
  }

  egress {
    from_port   = var.zero
    to_port     = var.zero
    protocol    = var.minus_one
    cidr_blocks = [var.anywhere]
  }
}

