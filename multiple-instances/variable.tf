variable "OS" {
  type = string
  default = "ami-002f6e91abff6eb96"
  description = "AMI of the instance"
  
}

variable "instance" {
  default = "t2.micro"
}

variable "instance_count" {
    type = number
    default = 3
  
}