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


module "ec2_cluster" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name = "my-cluster"
  instance_count = 1

  #ami = "ami-0d6621c01e8c2de2c"
  ami = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
  subnet_id = "subnet-044d936575cefe6b2"

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}