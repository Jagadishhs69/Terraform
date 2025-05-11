resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket-name

  tags = {
    Environment = var.env
    Name        = "${var.env}-bucket"
  }

}


