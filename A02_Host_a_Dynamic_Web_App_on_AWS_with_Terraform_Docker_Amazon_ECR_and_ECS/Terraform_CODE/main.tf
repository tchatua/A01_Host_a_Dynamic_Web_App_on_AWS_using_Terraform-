# configure AWS Provider
provider "aws" {
  region = var.region
  # profile = var.profile
}

# Backend to store the Terraform state file in S3
terraform {
  backend "s3" {
    bucket = "lea-07192023-terraform-state"
    key    = "d15/dwa/terraform.tfstate.dev"
    region = "us-east-1"
    # encrypt = true
    dynamodb_table = "Lea_Table"
    # profile = "tchatua"
  }
}