output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.ec2_web_server.instance_public_ip
}