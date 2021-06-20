resource "aws_spot_instance_request" "frontend" {
  ami                    = "ami-059e6ca6474628ef0"
  spot_price             = "0.0031"
  instance_type          = "t3.micro"

  tags = {
    Name = "frontend"
  }
}
provider "aws" {
  region = "us-east-1"
}
