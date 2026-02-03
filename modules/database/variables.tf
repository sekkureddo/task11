variable "database_name" {
  description = "Name of the database"
  type        = string
}

variable "database_username" {
  description = "Master username for the database"
  type        = string
  sensitive   = true
}

variable "database_password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}

variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "allowed_ips" {
  description = "List of CIDR blocks allowed to access the database"
  type        = string
  default     = "0.0.0.0/0"
}
