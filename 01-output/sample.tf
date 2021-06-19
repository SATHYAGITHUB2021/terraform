output "sample" {
  value = var.sample
}

output "sample1" {
  value = "${var.sample}"
}

output "sample2" {
  value = "${var.sample} it's me"
}

variable "sample" {
  default = "Hello World"
}

// Variable sample can be accessed var.sample or ${var.sample}, However
// var.sample can be used without quotes
// ${var.sample} is used within quotes
// Usually, ${} uses when we combine with some other data
// Terraform does not support single quote at any level.Only supports double quotes.

# Variable Data types
# String data type
variable "sample1" {
  default = "Hello World"
}

# Number data type
variable "sample2" {
  default = 100
}

# Boolean data type
variable "sample3" {
  default = yes
}

# Variable type list variable

variable "sample4" {
  default = [
    "Hello",
    1000,
    yes,
    "World"
  ]
}

output "sample4" {
  value = var.sample4[0]
}