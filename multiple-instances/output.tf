output "public_IP" {
    value = aws_instance.my_instance[*].public_ip
}