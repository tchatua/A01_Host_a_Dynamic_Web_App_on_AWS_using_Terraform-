# Allocate elastic IP. 
# This will be used for the NAT Gateway in the public subnet az1 
# terraform aws allocate elastic IP  
resource "aws_eip" "eip_for_nat_gateway_az1" {
  domain = var.domain

  tags = {
    Name          = "${var.name}-eip-for-nat-gateway-az1"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}

# Create nat gateway in public subnet az1 
# Terraform create aws nat gateway 
resource "aws_nat_gateway" "nat_gateway_az1" {
  allocation_id = aws_eip.eip_for_nat_gateway_az1.id
  subnet_id     = aws_subnet.public_subnet_az1.id

  tags = {
    Name          = "${var.name}-nat-gateway-az1"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }

  # To ensure proper ordering, I'll added an explicit dependency
  depends_on = [aws_internet_gateway.internet_gateway]
}

# Allocate elastic IP. 
# This will be used for the NAT Gateway in the public subnet az2 
# terraform aws allocate elastic IP  
resource "aws_eip" "eip_for_nat_gateway_az2" {
  domain = var.domain

  tags = {
    Name          = "${var.name}-eip-for-nat-gateway-az2"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}

# Create nat gateway in public subnet az2
# Terraform create aws nat gateway 
resource "aws_nat_gateway" "nat_gateway_az2" {
  allocation_id = aws_eip.eip_for_nat_gateway_az2.id
  subnet_id     = aws_subnet.public_subnet_az2.id

  tags = {
    Name          = "${var.name}-nat-gateway-az2"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }

  # To ensure proper ordering, I'll added an explicit dependency
  depends_on = [aws_internet_gateway.internet_gateway]
}

# Create private route table az1 and add route through nat gateway az1
#  Terraform create route table 
resource "aws_route_table" "private_route_table_az1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.cidr_block_private_route_table_az1
    gateway_id = aws_nat_gateway.nat_gateway_az1.id
  }

  tags = {
    Name          = "${var.name}-private-route-table-az1"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}

# Associate private app subnet az1 with private route table az1 
# terraform aws associate subnet with route table 
resource "aws_route_table_association" "private_app_subnet_az1_association" {
  subnet_id      = aws_subnet.private_app_subnet_az1.id
  route_table_id = aws_route_table.private_route_table_az1.id
}

# Associate private data subnet az1 with private route table az1 
# terraform aws associate subnet with route table 
resource "aws_route_table_association" "private_data_subnet_az1_association" {
  subnet_id      = aws_subnet.private_data_subnet_az1.id
  route_table_id = aws_route_table.private_route_table_az1.id
}

# Create private route table az2 and add route through nat gateway az2
#  Terraform create route table 
resource "aws_route_table" "private_route_table_az2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.cidr_block_private_route_table_az2
    gateway_id = aws_nat_gateway.nat_gateway_az2.id
  }

  tags = {
    Name          = "${var.name}-private-route-table-az2"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}

# Associate private app subnet az2 with private route table az2 
# terraform aws associate subnet with route table 
resource "aws_route_table_association" "private_app_subnet_az2_association" {
  subnet_id      = aws_subnet.private_app_subnet_az2.id
  route_table_id = aws_route_table.private_route_table_az2.id
}

# Associate private data subnet az2 with private route table az2 
# terraform aws associate subnet with route table 
resource "aws_route_table_association" "private_data_subnet_az2_association" {
  subnet_id      = aws_subnet.private_data_subnet_az2.id
  route_table_id = aws_route_table.private_route_table_az2.id
}