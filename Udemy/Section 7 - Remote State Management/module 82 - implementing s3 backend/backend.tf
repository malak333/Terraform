/*provider "aws" {
  region     = "us-east-2"
  access_key = #
  secret_key = #
}



terraform {
  backend "s3" {
    bucket = "kplabs-terraform-backend"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}
*/
terraform {
  backend "s3" {
    bucket = "mnobile-terraform"
    key = "state/terraform.tfstate"
    region = "us-east-2"
    encrypt = true
  }
}