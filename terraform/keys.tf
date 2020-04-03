resource "aws_key_pair" "my_key" {
    key_name = "IaasKey"
    public_key = file("/root/.ssh/id_rsa.pub")
}

