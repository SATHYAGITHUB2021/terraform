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