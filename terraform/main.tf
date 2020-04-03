# Configure the AWS Provider
provider "aws" {
  version = "~> 2.8"
  region  = "us-east-2"
}


# Criando bucket para salvar o Estado da Infraestrutura
terraform {
  backend "s3" {
    bucket = "iaas-terraform-demay"
    key    = "terraform.tsstate"
    region = "us-east-2"
  }
}

