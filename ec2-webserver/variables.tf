variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the EC2 Key Pair"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}
