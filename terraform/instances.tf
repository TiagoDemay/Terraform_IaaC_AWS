resource "aws_instance" "user1" {
    count           = var.qd_instancias
                 
    ami             = "ami-077cf8407f0b2025c"
    instance_type   = "t2.micro"
    key_name        = aws_key_pair.my_key.key_name
    subnet_id       = aws_subnet.public.id         // Aqui já fazemos o map do IPv4 Publico
    vpc_security_group_ids = ["${aws_security_group.sg.id}"] 
     
    tags = {
        Name                   =  "Ubuntu${count.index + 1}"
        "Owner${var.id_user}" =  "${var.id_user}"
    }
    depends_on   =  [aws_security_group.sg]
}



