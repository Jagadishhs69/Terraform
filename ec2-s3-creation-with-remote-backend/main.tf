resource "aws_s3_bucket" "mybucket" {
    bucket = var.bucket-name
 }

resource "aws_instance" "jags9999" {
  ami = var.instance_ami
  instance_type = var.instance_type
  count = var.instance_count
 }
