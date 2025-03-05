terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./vpc"
}

resource "aws_security_group" "this" {
  vpc_id      = module.vpc.vpc_id
  description = "allow SSH and HTTP inbound traffic"

  ///workaround
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "server-1" {
  source              = "./modules"
  subnet_id           = module.vpc.public_subnet_ids[0]
  security_group_id = aws_security_group.this.id
  internet_gateway = module.vpc.internet_gateway_id
}
