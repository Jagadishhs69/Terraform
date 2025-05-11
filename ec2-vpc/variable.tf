variable "aws_region" {
  type = string
  description = "Default AWS region"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type = string
}

variable "instance_type" {
  description = "EC2 Instance type"
  type = string
}

variable "key_name" {
  description = "Key pair name of the EC2 instance"
  type = string
}