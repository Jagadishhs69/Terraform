resource "aws_instance" "web" {
    ami             = "ami-002f6e91abff6eb96"
    instance_type   = "t2.micro"
    count = 3
  
    tags = {
        name = "Helloworld"
    }
}

resource "github_repository" "my-repo" {
    name        = "Terraform-repo"
    description = "This repo is created using Terraform"
    visibility  = "public"
}