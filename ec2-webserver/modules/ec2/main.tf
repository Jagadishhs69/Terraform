resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  provisioner "file" {
    source      = "${path.module}/../../files/index.html"
    destination = "/tmp/index.html"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("E:\\Preplaced-Stuff\\Terraform\\Terraform_Practical_Projects\\ec2-webserver\\my-terraform-key.pem")
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install nginx -y",
      "sudo cp /tmp/index.html /usr/share/nginx/html/index.html",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("E:\\Preplaced-Stuff\\Terraform\\Terraform_Practical_Projects\\ec2-webserver\\my-terraform-key.pem")
      host        = self.public_ip
    }
  }

  tags = {
    Name = "Terraform-Web-Server"
  }
}
