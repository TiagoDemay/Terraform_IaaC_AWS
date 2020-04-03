resource "aws_subnet" "private" {
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, 1)
  availability_zone       = data.aws_availability_zones.available.names[0]
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true

  tags = {
    Name = "Private"
  }
  depends_on = [aws_internet_gateway.gw]
}



resource "aws_subnet" "public" {
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, 2)
  availability_zone       = data.aws_availability_zones.available.names[1]
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true

  tags = {
    Name = "Public"
  }
}
