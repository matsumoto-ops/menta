provider "aws" {
  region  = "ap-northeast-1"
  profile = "dev-user"
  version = "3.0.0"
}

terraform {
  required_version = ">= 0.11.7"

  backend "s3" {
    bucket         = "terraform-state-storage-kensyu"
    key            = "terraform.tfstate"
    region         = "ap-northeast-1"
  }
}

resource "aws_s3_bucket" "tfstate" {
  bucket = "terraform-state-storage-kensyu"
  versioning {
    enabled = true
  }
}
