terraform {
  backend "s3" {
    bucket = "mnobile-terraform"
    key = "state/terraform.tfstate"
    region = "us-east-2"
    encrypt = true
    dynamodb_table = "mnobile-terraform-lock"
  }
}

resource "time_sleep" "wait_150_seconds" {

  create_duration = "150s"
}