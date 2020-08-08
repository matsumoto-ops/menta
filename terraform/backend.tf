provider "aws" {
  region  = var.aws_region
}

terraform {
  required_version = "0.12.8"
  backend "s3" {
    bucket   = "terraform-state-storage-kensyu"
    key      = "terraform.tfstate"
    profile  = "dev-user"  # ~/.aws/credentials
    region   = "ap-northeast-1"
    encrypt = true

  }
}