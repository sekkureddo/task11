resource "aws_db_instance" "postgres" {
  allocated_storage      = 20
  db_name                = var.database_name
  engine                 = "postgres"
  engine_version         = "17.6"
  instance_class         = "db.t3.micro"
  username               = var.database_username
  password               = var.database_password
  parameter_group_name   = "default.postgres17"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_security_group.id]
}

resource "aws_db_subnet_group" "subnet_group" {
  name       = "${var.database_name}-subnet-group"
  subnet_ids = var.subnet_ids //List of vpc subnets
}

resource "aws_security_group" "db_security_group" {
  name        = "${var.database_name}-sg"
  description = "Security group for RDS instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ips]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
