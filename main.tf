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

data "aws_ami" "ami" {
  owners      = ["amazon"] #aws owner id
  most_recent = true

  filter {
    name = "name"
    values =  ["ubuntu/images/hvm-ssd-gp3/*"]
  }
}

resource "aws_instance" "server" { 
  ami = data.aws_ami.ami.id
  instance_type = "t3.micro"

  tags = {
    "Name" = "HiWorld"
  }
  
}

