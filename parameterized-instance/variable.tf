variable "create_ec2_instance" {
  description = "whether to create ec2 instance"
  type = bool
  default = false
}

variable "instance_ami" {
  default = "ami-002f6e91abff6eb96"
}

variable "instance_type" {
  default = "t2.micro"
}