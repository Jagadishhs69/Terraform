resource "aws_instance" "myinstance" {
  count             = var.create_ec2_instance ? 1 : 0
  ami               = var.instance_ami
  instance_type     = var.instance_type
}