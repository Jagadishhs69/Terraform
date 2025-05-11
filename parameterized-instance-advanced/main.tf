resource "aws_instance" "this" {
  count         = var.create_ec2_instance ? 1 : 0
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = var.instance_name
  }
}
