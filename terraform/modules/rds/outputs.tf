output "db_instance_id" {
  description = "RDS instance ID"
  value = aws_db_instance.main.id
}