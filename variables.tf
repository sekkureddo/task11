variable "public_inst_key" {
  description = "SSH key pair name for public/bastion instance"
  type        = string
  sensitive   = true
}

variable "private_inst_key" {
  description = "SSH key pair name for private instance"
  type        = string
  sensitive   = true
}
