resource "aws_spot_instance_request" "frontend" {
  count                  = length(var.COMPONENTS)
  ami                    = "ami-059e6ca6474628ef0"
  spot_price             = "0.0031"
  instance_type          = "t3.micro"

  tags = {
    Name = element(var.COMPONENTS, count.index)
  }
}
provider "aws" {
  region = "us-east-1"
}

variable "COMPONENTS" {}