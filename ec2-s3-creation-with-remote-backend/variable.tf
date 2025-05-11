variable "instance_ami" {
  type = string
  default = "ami-002f6e91abff6eb96"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_count" {
  type = number
  default = 3
}

variable "bucket-name" {
  default = "jagadish999966bucket"
}