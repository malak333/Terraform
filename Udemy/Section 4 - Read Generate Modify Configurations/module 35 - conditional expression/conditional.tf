/*provider "aws" {
  region     = "us-east-2"
  access_key = #
  secret_key = #
}
*/

variable "istest" {}

resource "aws_instance" "dev" {
   ami = "ami-0f3c9c466bb525749"
   instance_type = "t2.micro"
   count = var.istest == true ? 3 : 0
}

resource "aws_instance" "prod" {
   ami = "ami-0f3c9c466bb525749"
   instance_type = "t2.large"
   count = var.istest == false ? 1 : 0
}