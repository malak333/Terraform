data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm*"] #["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "my-ec2-terraform" {
  #ami = "ami-082b5a644766e0e6f"
  ami = data.aws_ami.app_ami.id
  # instance_type = "t2.micro"
  instance_type = var.instance_type
  # key_name = "ec2-key"
  # vpc_security_group_ids = [
  # aws_security_group.allow_ssh_and_http_conn.id]
}
