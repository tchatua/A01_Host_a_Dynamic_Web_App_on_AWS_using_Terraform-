# Create RDS Database from the available snapshot

# Create database subnet group
resource "aws_db_subnet_group" "database_subnet_group" {
  name = "${var.project_name}-${var.environment}-database-subnets-group"

  subnet_ids = [
    aws_subnet.private_data_subnet_az2.id,
    aws_subnet.private_data_subnet_az2.id
  ]

  description = var.description_database_subnet_group

  tags = {
    Name = "${var.project_name}-${var.environment}-database-subnets-group"
  }
}

# Get information about a database snapshot 
data "aws_db_snapshot" "latest_db_snapshot" {
  db_snapshot_identifier = var.db_snapshot_identifier_database_snapshot
  most_recent            = var.most_recent_database_snapshot
  snapshot_type          = var.snapshot_type_database_snapshot
}

# Launch an rds instance from a database snapshot
resource "aws_db_instance" "database_instance" {
  instance_class         = var.database_instance_class
  skip_final_snapshot    = var.snapshot_of_database_instance
  availability_zone      = data.aws_availability_zones.availability_zone.names[1]
  identifier             = var.database_instance_identifier
  snapshot_identifier    = data.aws_db_snapshot.latest_db_snapshot.id
  db_subnet_group_name   = aws_db_subnet_group.database_subnet_group.name
  multi_az               = var.multi_az_deployment # Create a standby db instance
  vpc_security_group_ids = [aws_security_group.database_security_group.id]
}

