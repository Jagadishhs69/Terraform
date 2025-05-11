# Main Terraform configuration

# Call VPC Module
module "vpc" {
  source = "./modules/vpc"

  environment = var.environment
  cidr_block  = var.environment == "prod" ? var.prod_cidr_block : var.dev_cidr_block
}

# Call EC2 Module
module "ec2" {
  source = "./modules/ec2"

  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  subnet_id         = module.vpc.public_subnet_id
  instance_type     = var.environment == "prod" ? var.prod_instance_type : var.dev_instance_type
  security_group_id = module.vpc.ec2_security_group_id
}

# Call S3 Module
module "s3" {
  source = "./modules/s3"

  environment = var.environment
  bucket_name = "${var.environment}-${var.bucket_name}"
}