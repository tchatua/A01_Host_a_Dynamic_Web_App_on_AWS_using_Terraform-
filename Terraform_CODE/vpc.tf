# Create VPC
# Terraform aws create vpc
resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block_vpc
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name          = "${var.name}-vpc"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}

# Create Internet Gateway and attach it to vpc 
# Terraform aws create internet gateway 
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name          = "${var.name}-internet-gateway"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}

# Create public subnet az1 
# Terraform aws create subnet 
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_block_public_subnet_az1
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = var.map_public_ip_on_launch_yes

  tags = {
    Name          = "${var.name}-public-subnet-az1"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}

# Create public subnet az2
# Terraform aws create subnet 
resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_block_public_subnet_az2
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = var.map_public_ip_on_launch_yes

  tags = {
    Name          = "${var.name}-public-subnet-az2"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}

# Create route table and add public route
# Terraform aws create route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.cidr_block_public_route_table
    gateway_id = aws_internet_gateway.internet_gateway.id

  }

  tags = {
    Name          = "${var.name}-public-route-table"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}

# associate public subnet az1 to "Public route table"
# Terraform aws associate subnet with route table
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public_route_table.id
}

# associate public subnet az2 to "Public route table"
# Terraform aws associate subnet with route table
resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
  subnet_id      = aws_subnet.public_subnet_az2.id
  route_table_id = aws_route_table.public_route_table.id
}

# Create private app subnet az1 
# Terraform aws create subnet 
resource "aws_subnet" "private_app_subnet_az1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_block_private_app_subnet_az1
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = var.map_public_ip_on_launch_no

  tags = {
    Name          = "${var.name}-private-app-subnet-az1"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}

# Create private app subnet az2
# Terraform aws create subnet 
resource "aws_subnet" "private_app_subnet_az2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_block_private_app_subnet_az2
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = var.map_public_ip_on_launch_no

  tags = {
    Name          = "${var.name}-private-app-subnet-az2"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}

# Create private data subnet az1 
# Terraform aws create subnet 
resource "aws_subnet" "private_data_subnet_az1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_block_private_data_subnet_az1
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = var.map_public_ip_on_launch_no

  tags = {
    Name          = "${var.name}-private-data-subnet-az1"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}

# Create private data subnet az2
# Terraform aws create subnet 
resource "aws_subnet" "private_data_subnet_az2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_block_private_data_subnet_az2
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = var.map_public_ip_on_launch_no

  tags = {
    Name          = "${var.name}-private-data-subnet-az2"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}
