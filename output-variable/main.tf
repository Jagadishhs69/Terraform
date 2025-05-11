resource "aws_instance" "web" {
    ami             = var.os
    instance_type   = var.size

    tags = {
      name = var.name
    }
  
}

#s3 bucket
resource "aws_s3_bucket" "mybucket" {
    bucket = var.bucketname
}

resource "aws_iam_user" "myuser" {
  name = "${var.username}-user"
}

output "IPaddress" {
  value = aws_instance.web.public_ip
}

output "dns" {
  value = aws_instance.web.public_dns
}