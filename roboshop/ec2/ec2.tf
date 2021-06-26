resource "aws_spot_instance_request" "cheap_worker" {
  count                  = length(var.COMPONENTS)
  ami                    = "ami-059e6ca6474628ef0"
  spot_price             = "0.0031"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-05150ce557f1cc782"]

  tags = {
    Name = element(var.COMPONENTS, count.index)
  }
}
provider "aws" {
  region                = "us-east-1"
}

variable "COMPONENTS" {}

resource "time_sleep" "wait" {
  depends_on            = [aws_spot_instance_request.cheap_worker]
  create_duration       = "120s"
}

resource "aws_ec2_tag" "example" {
  depends_on            = [time_sleep.wait]
  count                 = length(var.COMPONENTS)
  resource_id           = element(aws_spot_instance_request.cheap_worker.*.spot_instance_id, count.index)
  key                   = "Name"
  value                 = element(var.COMPONENTS, count.index)
}

resource "aws_ec2_tag" "monitor" {
  depends_on            = [time_sleep.wait]
  count                 = length(var.COMPONENTS)
  resource_id           = element(aws_spot_instance_request.cheap_worker.*.spot_instance_id, count.index)
  key                   = "Monitor"
  value                 = "yes"
}

resource "aws_route53_record" "dns" {
  depends_on            = [time_sleep.wait]
  count                 = length(var.COMPONENTS)
  zone_id               = "Z04373561YPMQTZH9WA2Z"
  name                  = "${element(var.COMPONENTS, count.index)}.roboshop.internal"
  type                  = "A"
  ttl                   = "300"
  records               = [element(aws_spot_instance_request.cheap_worker.*.private_ip, count.index)]
}