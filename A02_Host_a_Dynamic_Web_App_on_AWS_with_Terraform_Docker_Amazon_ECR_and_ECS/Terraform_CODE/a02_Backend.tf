# Store the terraform state file in S3 and lock with DynamoDB
terraform {
  backend "s3" {
    bucket         = "lea-07192023-terraform-state"
    key            = "d14/dwa-ecs/terraform.tfstate.dev"
    region         = "us-east-1"
    dynamodb_table = "Lea_Table"
    # encrypt = true
    # profile = "tchatua"
  }
}