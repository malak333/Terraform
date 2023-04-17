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

resource "aws_instance" "instance-1" {
   # ami = "ami-082b5a644766e0e6f"
   #ami = "ami-0f3c9c466bb525749"
   ami = data.aws_ami.app_ami.id
   instance_type = "t2.micro"
   count = 3
}