variable "aws_account_id" {
  default = "756259137159"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "profile_name" {}
variable "backend_bucket_name" { 
    default = "terraform-state-storage-kensyu"
 }

variable "aws_region" {
  default = "ap-northeast-1"
}