terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.33.0"
    }
  }  

  backend "s3" {
    bucket         = "remote-state-devops-88s" # Must match the bucket name created above
    key            = "remote-state.tfstate" # Object key for the state file
    region         = "us-east-1" # Match your AWS region
    encrypt        = true
    use_lockfile   = true # Enable S3 native locking
  }
}

provider "aws" {
  region = "us-east-1"
}