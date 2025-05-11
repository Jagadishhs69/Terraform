resource "aws_instance" "web_server" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              mkdir -p /var/www/html
              # echo "Welcome to my web server!" > /var/www/html/index.html - commented this line
              EOF

  tags = {
    Name = "WebServer"
  }
}

resource "aws_security_group" "web_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Restrict to your IP in production
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebServerSG"
  }
}

resource "null_resource" "copy_html" {
  depends_on = [aws_instance.web_server]

provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /var/www/html",
      "sudo chown ec2-user:ec2-user /var/www/html/",
      "sudo chmod 755 /var/www/html/",
      "sudo systemctl restart nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("E:\\Preplaced-Stuff\\Terraform\\Terraform_Practical_Projects\\new-nginx-webserver\\my-terraform-key.pem")
      host        = aws_instance.web_server.public_ip
    }
  }
  provisioner "file" {
    #source      = "${path.module}/../../index.html"
    source      = "${path.module}/index.html"
    #source = file("E:\\Preplaced-Stuff\\Terraform\\Terraform_Practical_Projects\\new-nginx-webserver\\index.html")
    destination = "/var/www/html/index.html"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("E:\\Preplaced-Stuff\\Terraform\\Terraform_Practical_Projects\\new-nginx-webserver\\my-terraform-key.pem") 
      host        = aws_instance.web_server.public_ip
    }
  }

    provisioner "remote-exec" {
    inline = [
      "sudo chown root:root /var/www/html/index.html",
      "sudo chmod 644 /var/www/html/index.html",
      "sudo systemctl restart nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("E:\\Preplaced-Stuff\\Terraform\\Terraform_Practical_Projects\\new-nginx-webserver\\my-terraform-key.pem")
      host        = aws_instance.web_server.public_ip
    }
  }

  
}