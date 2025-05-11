resource "aws_instance" "web_server" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [var.security_group_id]

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y nginx",
    ]
    connection {
      type        = "ssh"
      user        = var.provisioner_user
      private_key = file("E:\\Preplaced-Stuff\\Terraform\\Terraform_Practical_Projects\\ec2-webserver\\my-terraform-key.pem")
      host        = self.public_ip
    }
  }

  provisioner "file" {
    source      = var.local_html_path
    destination = "/tmp/index.html"
    connection {
      type        = "ssh"
      user        = var.provisioner_user
      private_key = file("E:\\Preplaced-Stuff\\Terraform\\Terraform_Practical_Projects\\ec2-webserver\\my-terraform-key.pem")
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mv /tmp/index.html /var/www/html/index.html",
      "sudo systemctl restart nginx",
    ]
    connection {
      type        = "ssh"
      user        = var.provisioner_user
      private_key = file("E:\\Preplaced-Stuff\\Terraform\\Terraform_Practical_Projects\\ec2-webserver\\my-terraform-key.pem")
      host        = self.public_ip
    }
  }
}

