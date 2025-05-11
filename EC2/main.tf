terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-south-1"
}

resource "aws_instance" "Jenkins_server" {
  ami           = "ami-0449c34f967dbf18a"
  instance_type = "t2.micro"

  tags = {
    Name = "Jenkins_server"
  }
}