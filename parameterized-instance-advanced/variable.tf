variable "create_ec2_instance" {
  description = "Whether to create the EC2 instance"
  type        = bool
  default     = false
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "example-instance"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Key pair name to connect to the instance"
  type        = string
  default     = null
}

variable "aws_region" {
  type = string
  description = "Default AWS region"
}