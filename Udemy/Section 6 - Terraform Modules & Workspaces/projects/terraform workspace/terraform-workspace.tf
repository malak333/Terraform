/*
### Terraform Workspace commands:
```sh
terraform workspace -h
terraform workspace show
terraform workspace new dev
terraform workspace new prd
terraform workspace list
terraform workspace select dev
```
*/

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
   instance_type = lookup(var.instance_type,terraform.workspace)
}

variable "instance_type" {
  type = map(string)

  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prd     = "t2.small"
  }
}
