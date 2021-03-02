terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.29.1"
    }
  }
}

provider "aws" {
  # Configuration options
  region     = "us-east-1"
  access_key = "AKIAY53THYX2CDKBDOEA"
  secret_key = "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"
}