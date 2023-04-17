/*provider "aws" {
  region     = "us-east-2"
  access_key = #
  secret_key = #
}


resource "aws_eip" "lb" {
  vpc      = true
  depends_on = [null_resource.health_check]
}


resource "null_resource" "health_check" {

 provisioner "local-exec" {

    command = "curl https://google.com"
  }
}
*/