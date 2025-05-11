resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags       = merge(local.common_tags, {name = "main-vpc"})
}

resource "aws_subnet" "public" {
  vpc_id                    = aws_vpc.main.id
  cidr_block                = var.public_subnet_cidr
  map_public_ip_on_launch   = true
  availability_zone         = "${var.aws_region}a"
  tags                      = merge(local.common_tags, {name = "public-subnet"})
}

resource "aws_subnet" "private" {
  vpc_id                    = aws_vpc.main.id
  cidr_block                = var.private_subnet_cidr
  map_public_ip_on_launch   = true
  availability_zone         = "${var.aws_region}a"
  tags                      = merge(local.common_tags, {name = "private-subnet"})
}

resource "aws_internet_gateway" "igw" {
  vpc_id   = aws_vpc.main.id
  tags     = merge(local.common_tags, {name = "internet-gateway"})
}

resource "aws_eip" "nat" {
  #vpc = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.public.id
  tags     = merge(local.common_tags, {name = "nat-gateway"})
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags   = merge(local.common_tags, { Name = "public-rt" })
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Allow HTTP and SSH"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, { Name = "ec2-sg" })
}

resource "aws_instance" "nginx" {
  ami                    = "ami-002f6e91abff6eb96"
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install nginx
              systemctl enable nginx
              systemctl start nginx
              EOF

  tags = merge(local.common_tags, { Name = "nginx-server" })
}

