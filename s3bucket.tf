resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket # Ensure this name is globally unique
  acl    = var.acl

  tags = {
    Name        = var.s3_Name
    Environment = var.Environment
  }
}

terraform {
  backend "s3" {
    bucket         = "my-unique-bucket-name-20240832"
    key            = "terraform/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
