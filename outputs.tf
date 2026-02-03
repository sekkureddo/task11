# VPC Module Outputs
output "vpc_id" {
  description = "VPC ID for binding new resources"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "Public subnet ID for public instances/load balancers"
  value       = module.vpc.public_subnet_id
}

output "private_subnet_ids" {
  description = "List of private subnet IDs for HA (high availability) setups"
  value       = module.vpc.private_subnet_ids
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = module.vpc.vpc_cidr
}

# Instances Module Outputs
output "bastion_public_ip" {
  description = "Public IP address of the bastion host for SSH access"
  value       = module.instances.bastion_public_ip
}

output "bastion_instance_id" {
  description = "Instance ID of the bastion host for AWS CLI commands"
  value       = module.instances.bastion_instance_id
}

output "private_instance_ip" {
  description = "Private IP address of the private instance for internal access through bastion"
  value       = module.instances.private_private_ip
}

output "private_instance_id" {
  description = "Instance ID of the private instance for AWS CLI commands"
  value       = module.instances.private_instance_id
}

output "public_security_group_id" {
  description = "Security group ID of the public/bastion instance for adding rules later"
  value       = module.instances.public_security_group_id
}

output "private_security_group_id" {
  description = "Security group ID of the private instance for DB or other integrations"
  value       = module.instances.private_security_group_id
}

# Database Module Outputs
output "rds_endpoint" {
  description = "RDS endpoint for application connectivity"
  value       = module.database.rds_endpoint
}

output "rds_address" {
  description = "RDS instance address (hostname only, without port)"
  value       = module.database.rds_address
}

output "db_name" {
  description = "Database name created on the RDS instance"
  value       = module.database.db_name
}

output "db_username" {
  description = "Master username for the RDS database"
  value       = module.database.db_username
  sensitive   = true
}

output "db_port" {
  description = "Port number for database connections"
  value       = module.database.db_port
}
