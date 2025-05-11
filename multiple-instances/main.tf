resource "aws_instance" "my_instance" {
    ami             = var.OS
    instance_type   = var.instance
    count           = var.instance_count
  
}

