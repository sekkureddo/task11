variable "ami" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = "ami-0b6c6ebed2801a5cb"
}

variable "vpc_id" {
  description = "In which vpc create instances"
  type        = string
}

variable "my_ips" {
  description = "List of objects allowed to access via SSH. Each object has `IP` (CIDR) and optional `name`."
  type = list(object({
    IP   = string
    name = string
  }))
  default = []
}

variable "public_subnet_id" {
  description = "Subnet ID for the public/bastion instance"
  type        = string
}

variable "private_subnet_id" {
  description = "Subnet ID for the private instance"
  type        = string
}

variable "public_inst_key" {
  description = "Key for the bastion instance"
  type        = string
  sensitive   = true
}

variable "private_inst_key" {
  description = "Key pair name for the private instance"
  type        = string
  sensitive   = true
}
