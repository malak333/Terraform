/*
terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "5.18.0"
    }
  }
}

provider "github" {
  token = "<INSERT TOKEN HERE>"
}

resource "github_repository" "terraform-repo" {
  name        = "terraform-repo"
  visibility = "private"

}
*\