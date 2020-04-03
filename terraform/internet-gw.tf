resource "aws_internet_gateway" "gw" {
    vpc_id   = aws_vpc.main.id

    tags = {
        Name = "iaas_gateway"
    }
    depends_on = [aws_vpc.main]
  
}
