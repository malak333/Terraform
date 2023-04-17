/*provider "aws" {
  region     = "us-east-2"
  access_key = #
  secret_key = #
}
*/


locals {
  common_tags = {
    Owner = "DevOps Team"
    service = "backend"
  }
}
resource "aws_instance" "app-dev" {
   ami = "ami-0f3c9c466bb525749"
   instance_type = "t2.micro"
   tags = local.common_tags
}

resource "aws_instance" "db-dev" {
   ami = "ami-0f3c9c466bb525749"
   instance_type = "t2.small"
   tags = local.common_tags
}

resource "aws_ebs_volume" "db_ebs" {
  availability_zone = "us-east-2a"
  size              = 8
  tags = local.common_tags
}