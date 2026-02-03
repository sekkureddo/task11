output "rds_endpoint" {
  description = "RDS endpoint for application connectivity"
  value       = aws_db_instance.postgres.endpoint
}

output "rds_address" {
  description = "RDS instance address (hostname only, without port)"
  value       = aws_db_instance.postgres.address
}

output "db_name" {
  description = "Database name created on the RDS instance"
  value       = aws_db_instance.postgres.db_name
}

output "db_username" {
  description = "Master username for the RDS database"
  value       = aws_db_instance.postgres.username
  sensitive   = true
}

output "db_port" {
  description = "Port number for database connections"
  value       = aws_db_instance.postgres.port
}
