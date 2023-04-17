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

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "allow_ssh_and_http_conn" {
  name        = "allow_ssh_conn_and_http_conn"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP into VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "myec2" {
  #ami = "ami-082b5a644766e0e6f"
  ami = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
  key_name = "ec2-key"
  vpc_security_group_ids = [
    aws_security_group.allow_ssh_and_http_conn.id]

  connection {
    type = "ssh"
    user = "ec2-user"
    # private_key = file("./terraform")
    private_key = file("/Users/michaelnobile/.ssh/terraform")
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1",
      "sudo systemctl start nginx"
    ]
  }
}

  resource "aws_key_pair" "ec2-key" {
    key_name = "ec2-key"
    # public_key = file("${path.module}/id_rsa.pub")
    # public_key = file("./terraform.pub")
    public_key = file("/Users/michaelnobile/.ssh/terraform.pub")

  }
