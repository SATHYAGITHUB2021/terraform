terraform {
  backend "s3" {
    bucket         = "sathya-aws-bucket"
    key            = "roboshop/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "sathya-table"
  }
}

provider "aws" {
  region = "us-east-1"
}