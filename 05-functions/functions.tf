variable "fruits" {
  default = ["apple", "banana", "berry", "mango"]
}

output "NO_OF_FRUITS" {
  value = length(var.fruits)
}

output "fruit-value" {
  value = element(var.fruits, 0)
}

output "particular-fruit" {
  value = index(var.fruits, "berry")
}