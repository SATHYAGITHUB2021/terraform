variable "fruits" {
  default = ["apple", "banana"]
}

output "NO_OF_FRUITS" {
  value = length(var.fruits)
}

output "fruit-value" {
  value = element(var.fruits, 0)
}