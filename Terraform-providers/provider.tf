provider "aws" {
  region = "ap-south-1"
}

provider "aws" {
    region = "us-east-1"
    alias  = "west"
 
}

provider "github"{
    token = "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"
}