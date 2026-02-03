resource "aws_instance" "bastion" {
  ami                         = var.ami
  instance_type               = "t2.nano"
  key_name                    = aws_key_pair.bastion_key.key_name
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [aws_security_group.public_security_group.id]
  associate_public_ip_address = true
}

resource "aws_instance" "private" {
  ami                         = var.ami
  instance_type               = "t2.nano"
  key_name                    = aws_key_pair.private_key.key_name
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [aws_security_group.private_security_group.id]
  associate_public_ip_address = false
}

resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion-key"
  public_key = var.public_inst_key
}

resource "aws_key_pair" "private_key" {
  key_name   = "private-key"
  public_key = var.private_inst_key
}

resource "aws_security_group" "public_security_group" {
  vpc_id = var.vpc_id
  dynamic "ingress" {
    for_each = var.my_ips
    content {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [ingress.value.IP]
      description = ingress.value.name
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "private_security_group" {
  vpc_id = var.vpc_id
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public_security_group.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
