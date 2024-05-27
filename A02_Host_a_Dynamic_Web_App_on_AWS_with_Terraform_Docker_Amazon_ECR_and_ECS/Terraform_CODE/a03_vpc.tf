# create vpc
resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block_vpc
  instance_tenancy     = var.instance_tenancy_vpc
  enable_dns_hostnames = var.enable_dns_hostnames_vpc

  tags = {
    Name = "${var.project_name}-${var.environment}-vpc"
  }
}

# create internet gateway and attach it to vpc
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.project_name}-${var.environment}-igw"
  }
}

# Use data source to get all availabilitry zones in region
data "aws_availability_zones" "availability_zone" {}

# Create public subnet az1 
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_block_public_subnet_az1
  availability_zone       = data.aws_availability_zones.availability_zone.names[0]
  map_public_ip_on_launch = var.map_public_ip_on_launch_public_subnet

  tags = {
    Name = "${var.project_name}-${var.environment}-public-subnet-az1"
  }
}

# Create public subnet az2
resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_block_public_subnet_az2
  availability_zone       = data.aws_availability_zones.availability_zone.names[1]
  map_public_ip_on_launch = var.map_public_ip_on_launch_public_subnet

  tags = {
    Name = "${var.project_name}-${var.environment}-public-subnet-az2"
  }
}

# Create route table and public route
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.anywhere_on_the_internet
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-public-route-table"
  }
}

# associate public subnet az1 to "public route table"
resource "aws_route_table_association" "public_subnet_az1_rt_association" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public_route_table.id
}

# associate public subnet az2 to "public route table"
resource "aws_route_table_association" "public_subnet_az2_rt_association" {
  subnet_id      = aws_subnet.public_subnet_az2.id
  route_table_id = aws_route_table.public_route_table.id
}

# create private app subnet az1
resource "aws_subnet" "private_app_subnet_az1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_block_private_app_subnet_az1
  availability_zone       = data.aws_availability_zones.availability_zone.names[0]
  map_public_ip_on_launch = var.map_public_ip_on_launch_private_subnet

  tags = {
    Name = "${var.project_name}-${var.environment}-private-app-subnet-az1"
  }
}

# create private app subnet az2
resource "aws_subnet" "private_app_subnet_az2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_block_private_app_subnet_az2
  availability_zone       = data.aws_availability_zones.availability_zone.names[1]
  map_public_ip_on_launch = var.map_public_ip_on_launch_private_subnet

  tags = {
    Name = "${var.project_name}-${var.environment}-private-app-subnet-az2"
  }
}

# create private data subnet az1
resource "aws_subnet" "private_data_subnet_az1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_block_private_data_subnet_az1
  availability_zone       = data.aws_availability_zones.availability_zone.names[0]
  map_public_ip_on_launch = var.map_public_ip_on_launch_private_subnet

  tags = {
    Name = "${var.project_name}-${var.environment}-private-data-subnet-az1"
  }
}

# create private data subnet az2
resource "aws_subnet" "private_data_subnet_az2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_block_private_data_subnet_az2
  availability_zone       = data.aws_availability_zones.availability_zone.names[1]
  map_public_ip_on_launch = var.map_public_ip_on_launch_private_subnet

  tags = {
    Name = "${var.project_name}-${var.environment}-private-data-subnet-az2"
  }
}

