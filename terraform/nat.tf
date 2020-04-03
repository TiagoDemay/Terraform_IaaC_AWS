resource "aws_eip" "gw" {
    count = var.az_count
    vpc   = true

    tags = {
        Name = "iaas_eip"
    }
}

resource "aws_nat_gateway" "gw" {
    count          = var.az_count
    subnet_id      = element(aws_subnet.public.*.id, count.index)
    allocation_id  = element(aws_eip.gw.*.id,count.index)

    tags = {
        Name = "iaas_nat"
    }
  
}
