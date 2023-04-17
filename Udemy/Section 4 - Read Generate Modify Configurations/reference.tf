/*provider "aws" {
  region     = "us-east-2"
  access_key = #
  secret_key = #
}
*/

resource "aws_instance" "my_first_ec2" {
   ami = var.ami
   instance_type = var.instance_type
}

resource "aws_eip" "lb" {
  vpc      = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.my_first_ec2.id
  allocation_id = aws_eip.lb.id
}

resource "aws_security_group" "allow_tls" {
  name        = var.aws_security_group_name
  vpc_id      = "vpc-0270268e35a6e310c"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]

#    cidr_blocks = [aws_eip.lb.public_ip/32]
  }
}