
# resource "aws_instance" "inst" {
#     count                  = var.qd_instancias
#     ami                    = "ami-077cf8407f0b2025c"
#     instance_type          = "t2.micro"
#     key_name               = aws_key_pair.my_key.key_name
#     subnet_id              = aws_subnet.public.id         
#     vpc_security_group_ids = ["${aws_security_group.sg.id}"] 
     
#     tags = {
#          Name                  =  "Ubuntu${count.index + 1}"
#         "Owner${var.id_user}" =  "${var.id_user}"
#     }
#     depends_on   =  [aws_security_group.sg]
# }

locals {
  # We've included this inline to create a complete example, but in practice
  # this is more likely to be loaded from a file using the "file" function.
  csv_data = <<-CSV
    id_user,id_group,name,instance_type,ami
    1,101,neo.matrix,t2.micro,ami-077cf8407f0b2025c
    1,102,neo.matrix,t2.micro,ami-077cf8407f0b2025c
    1,103,neo.matrix,t2.micro,ami-077cf8407f0b2025c
    1,104,neo.matrix,t2.micro,ami-077cf8407f0b2025c
    1,105,neo.matrix,t2.micro,ami-077cf8407f0b2025c
    1,106,neo.matrix,t2.micro,ami-077cf8407f0b2025c
    1,107,neo.matrix,t2.micro,ami-077cf8407f0b2025c
    2,201,trinity.matrix,t2.micro,ami-077cf8407f0b2025c
    2,202,trinity.matrix,t2.micro,ami-077cf8407f0b2025c
    2,203,trinity.matrix,t2.micro,ami-077cf8407f0b2025c
    2,204,trinity.matrix,t2.micro,ami-077cf8407f0b2025c
    2,205,trinity.matrix,t2.micro,ami-077cf8407f0b2025c
    3,301,morpheus.matrix,t2.micro,ami-077cf8407f0b2025c
    4,401,demays.matrix,t2.micro,ami-077cf8407f0b2025c
  CSV

  instances = csvdecode(local.csv_data)
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
    depends_on   =  [aws_security_group.sg]  

}