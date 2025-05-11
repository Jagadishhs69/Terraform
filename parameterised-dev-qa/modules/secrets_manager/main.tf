resource "aws_secretsmanager_secret" "this" {
  name = var.secret_name

  tags = {
    Environment = var.env
    Name        = "${var.env}-secret"
  }
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = var.secret_value
}
