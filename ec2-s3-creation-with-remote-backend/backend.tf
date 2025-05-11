terraform {
  backend "s3" {
    bucket = "jagadish999966bucket"
    key = "jagadish999966bucket/dev/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
  
  }
}
