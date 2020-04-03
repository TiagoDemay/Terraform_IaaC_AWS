resource "aws_security_group" "sg" {
    name            = "sg_iaas"
    vpc_id          = aws_vpc.main.id
    
    
    ingress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  
    } 

    ingress {
        description = "HTTP"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
    }    

    ingress {
        description = "All traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = [aws_vpc.main.cidr_block]  
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        name        = "sg_iaas"
    }
    depends_on      = [aws_vpc.main]
  
}
