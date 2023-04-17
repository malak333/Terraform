/*provider "aws" {
  region     = "us-east-2"
  access_key = #
  secret_key = #
}
*/

data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm*"] #["amzn2-ami-hvm*"]
  }
}
resource "aws_instance" "myec2" {
   #ami = "ami-082b5a644766e0e6f"
   ami = data.aws_ami.app_ami.id
   instance_type = "t2.micro"
}


resource "aws_eip" "lb" {
  instance = aws_instance.myec2.id
  vpc      = true
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.private_ip}/32"]

  }
}
/*
Commands Used:

terraform graph > graph.dot
yum install graphviz
brew install graphviz
cat graph.dot | dot -Tsvg > graph.svg
*/