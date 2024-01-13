resource "aws_instance" "web" {
  ami           = "ami-03265a0778a880afb" #devops-practice
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls_mysg.id]
  

  tags = {
    Name = "MyTerraform"
  }
}

resource "aws_security_group" "allow_tls_mysg" {
  name        = var.SecurityGroup
  description = "Allow TLS inbound traffic rule"
  #vpc_id      = aws_vpc.main.id

  ingress {
    description      = "inbound rule"
    from_port        = var.From_Port
    to_port          = var.To_Port
    protocol         = "tcp"
    cidr_blocks      = var.CIDR_Block
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = var.From_Port
    to_port          = var.To_Port
    protocol         = "-1"
    cidr_blocks      = var.CIDR_Block
    #ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "roboshop_aws"
  }
}

