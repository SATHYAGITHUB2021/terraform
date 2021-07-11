data "aws_dynamodb_table" "tableName" {
  name = "sathya-table"
}

output "tableName" {
  value = data.aws_dynamodb_table.tableName
}