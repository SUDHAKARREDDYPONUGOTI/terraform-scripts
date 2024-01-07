resource "aws_instance" "web" {
  ami           = "ami-03265a0778a880afb" #devops-practice
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls_mysg]
  

  tags = {
    Name = "MyTerraform"
  }
}

resource "aws_security_group" "allow_tls_mysg" {
  name        = "allow_tls_mysg"
  description = "Allow TLS inbound traffic rule"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "inbound rule"
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

