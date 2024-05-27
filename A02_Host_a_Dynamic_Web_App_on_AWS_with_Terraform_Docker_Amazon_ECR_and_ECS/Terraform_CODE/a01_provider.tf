# configure AWS Provider
provider "aws" {
  region = var.region_to_create_resources
  # profile = var.profile

  default_tags {
    tags = {
      Automation    = var.automation
      Project       = var.project_name
      Environment   = var.environment
      Folder        = var.folder
      Author        = var.author
      Owner         = var.owner
      Administrator = var.administrator
      Description   = var.description
    }
  }
}
