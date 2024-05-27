resource "aws_vpc" "main" {
  cidr_block = 
  instance_tenancy = 
  enable_dns_hostnames = 

  tags = {
    Name          = "${var.name}-vpc"
    Environment = var.environment
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator  }
}