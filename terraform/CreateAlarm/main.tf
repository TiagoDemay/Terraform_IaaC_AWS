# Configure the AWS Provider
provider "aws" {
  version = "~> 2.8"
  region  = "us-east-2"
}


# Criando bucket para salvar o Estado dos Alarmes nas instancias
terraform {
  backend "s3" {
    bucket  = "aula2020supercompalarm"
    key     = "alarmes.tsstate"
    region  = "us-east-2"
    encrypt = true
  }
}
