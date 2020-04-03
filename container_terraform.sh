#!/bin/bash
# Criando o container com aplicação do terraform.

docker run -it -v $PWD:/app -w /app --entrypoint "" tiagodemay/terraform_aws:version1  sh