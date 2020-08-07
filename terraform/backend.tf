provider "aws" {
  profile = "dev-user"
  region  = var.aws_region
}

terraform {
  backend "s3" {
    bucket                  = var.backend_bucket_name
    key                     = "terraform.tfstate"
    region                  = var.aws_region
    profile = "dev-user"
  }
}