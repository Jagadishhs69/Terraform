module "ec2" {
  source         = "../modules/ec2"
  ami            = var.ami
  instance_type  = var.instance_type
#   subnet_id      = var.subnet_id
  user_data      = var.user_data
  env            = var.env
}

module "s3" {
  source     = "../modules/s3"
  bucket_name = var.bucket_name
  env        = var.env
}

module "secrets_manager" {
  source       = "../modules/secrets_manager"
  secret_name  = var.secret_name
  secret_value = var.secret_value
  env          = var.env
}
