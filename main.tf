terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::245915323250:role/terraform_usage"
    duration     = "1h"
    session_name = "terraform_usage"
  }
}


module "vpc" {
  source                    = "./modules/vpc"
  availability_zones        = ["us-east-1a", "us-east-1b"]
  vpc_cidr_block            = "10.0.0.0/16"
  public_subnet_cidr_block  = "10.0.1.0/24"
  private_subnet_cidr_block = ["10.0.2.0/24", "10.0.3.0/24"]
}

module "database" {
  source            = "./modules/database"
  database_name     = "mydatabase"
  database_username = "reddo"
  database_password = "12345678"
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.private_subnet_ids
  allowed_ips       = module.vpc.vpc_cidr

}


module "instances" {
  source            = "./modules/instances"
  ami               = "ami-0b6c6ebed2801a5cb"
  public_subnet_id  = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_ids[0]
  vpc_id            = module.vpc.vpc_id
  public_inst_key   = var.public_inst_key
  private_inst_key  = var.private_inst_key
  my_ips = [
    {
      IP   = "93.84.120.226/32"
      name = "Office IP"
    },
    {
      IP   = "80.249.93.28/32"
      name = "Home IP"
    }
  ]
}
