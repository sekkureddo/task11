
output "bastion_public_ip" {
  description = "Public IP address of the bastion host for SSH access"
  value       = aws_instance.bastion.public_ip
}

output "bastion_instance_id" {
  description = "Instance ID of the bastion host for AWS CLI commands"
  value       = aws_instance.bastion.id
}

output "private_private_ip" {
  description = "Private IP address of the private instance for internal access through bastion"
  value       = aws_instance.private.private_ip
}

output "private_instance_id" {
  description = "Instance ID of the private instance for AWS CLI commands"
  value       = aws_instance.private.id
}

output "public_security_group_id" {
  description = "Security group ID of the public/bastion instance for adding rules later"
  value       = aws_security_group.public_security_group.id
}

output "private_security_group_id" {
  description = "Security group ID of the private instance for DB or other integrations"
  value       = aws_security_group.private_security_group.id
}
