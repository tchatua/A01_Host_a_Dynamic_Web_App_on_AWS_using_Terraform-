# Allocate elastic IP. 
# This will be used for the nat gateway in the public subnet az1 
resource "aws_eip" "eip_az1" {
  domain = var.domain_eip

  tags = {
    Name = "${var.project_name}-${var.environment}-eip-az1"
  }
}

# This elastic IP will be used for the nat gateway in the public subnet az2
resource "aws_eip" "eip_az2" {
  domain = var.domain_eip

  tags = {
    Name = "${var.project_name}-${var.environment}-eip-az2"
  }
}

# Create nat gateway in public subnet az1
resource "aws_nat_gateway" "nat_gateway_az1" {
  allocation_id = aws_eip.eip_az1.id
  subnet_id     = aws_subnet.public_subnet_az1.id

  tags = {
    Name = "${var.project_name}-${var.environment}-nat-gw-az1"
  }
  # To ensure proper ordering, let add an explicite derpendency on internet gateway for the vpc
  depends_on = [aws_internet_gateway.internet_gateway]
}

# Create nat gateway in public subnet az2
resource "aws_nat_gateway" "nat_gateway_az2" {
  allocation_id = aws_eip.eip_az2.id
  subnet_id     = aws_subnet.public_subnet_az2.id

  tags = {
    Name = "${var.project_name}-${var.environment}-nat-gw-az2"
  }
  # To ensure proper ordering, let add an explicite derpendency on internet gateway for the vpc
  depends_on = [aws_internet_gateway.internet_gateway]
}

# Create a private route table az1 and add route through nat gateway az1
resource "aws_route_table" "private_route_table_az1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = var.anywhere_on_the_internet
    nat_gateway_id = aws_nat_gateway.nat_gateway_az1.id
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-private-rt-az1"
  }
}

# associate private app subnet az1 with private route table az1 
resource "aws_route_table_association" "private_app_subnet_az1_rt_az1_association" {
  subnet_id      = aws_subnet.private_app_subnet_az1.id
  route_table_id = aws_route_table.private_route_table_az1.id
}

# associate private data subnet az1 with private route table az1 
resource "aws_route_table_association" "private_data_subnet_az1_rt_az1_association" {
  subnet_id      = aws_subnet.private_data_subnet_az1.id
  route_table_id = aws_route_table.private_route_table_az1.id
}

# Create a private route table az2 and add route through nat gateway az2
resource "aws_route_table" "private_route_table_az2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = var.anywhere_on_the_internet
    nat_gateway_id = aws_nat_gateway.nat_gateway_az2.id
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-private-rt-az2"
  }
}

# associate private app subnet az2 with private route table az2
resource "aws_route_table_association" "private_app_subnet_az2_rt_az2_association" {
  subnet_id      = aws_subnet.private_app_subnet_az2.id
  route_table_id = aws_route_table.private_route_table_az2.id
}

# associate private data subnet az2 with private route table az2
resource "aws_route_table_association" "private_data_subnet_az2_rt_az2_association" {
  subnet_id      = aws_subnet.private_data_subnet_az2.id
  route_table_id = aws_route_table.private_route_table_az2.id
}

