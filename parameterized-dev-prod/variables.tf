# Variable definitions

variable "environment" {
  description = "Deployment environment (dev or prod)"
  type        = string
  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be either 'dev' or 'prod'."
  }
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "dev_cidr_block" {
  description = "CIDR block for dev environment"
  type        = string
}

variable "prod_cidr_block" {
  description = "CIDR block for prod environment"
  type        = string
}

variable "dev_instance_type" {
  description = "EC2 instance type for dev environment"
  type        = string
}

variable "prod_instance_type" {
  description = "EC2 instance type for prod environment"
  type        = string
}

variable "bucket_name" {
  description = "Base name for S3 bucket"
  type        = string
}