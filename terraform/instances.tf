
locals {
  instances = csvdecode(file("/app/planilha.csv"))
}


resource "aws_instance" "inst" {
    for_each = { for inst in local.instances : inst.id_group => inst }

    instance_type          = each.value.instance_type
    ami                    = each.value.ami
    key_name               = aws_key_pair.my_key.key_name
    subnet_id              = aws_subnet.public.id
    vpc_security_group_ids = ["${aws_security_group.sg.id}"]
   
    tags = {
        Name                          =  "IdGroup-${each.key}"
        "Owner${each.value.id_user}"  =  each.value.name  
    }
}