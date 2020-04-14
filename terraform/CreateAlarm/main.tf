# Configure the AWS Provider
provider "aws" {
  version = "~> 2.8"
  region  = "us-east-2"
}


# Criando bucket para salvar o Estado dos Alarmes nas instancias
terraform {
  backend "s3" {
    bucket  = "iaas-terraform-demay"
    key     = "alarmes.tsstate"
    region  = "us-east-2"
    encrypt = true
  }
}