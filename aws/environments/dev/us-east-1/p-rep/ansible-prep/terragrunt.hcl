terraform {
//  source = "github.com/${local.repo_owner}/${local.repo_name}.git?ref=0.1.0"
  source = "github.com/${local.repo_owner}/${local.repo_name}.git"
//  source = "../../../../../modules/${local.repo_name}"
}

locals {
  repo_owner = "robc-io"
  repo_name = "terraform-aws-icon-citizen-sg"
}


include {
  path = find_in_parent_folders()
}

dependency "ec2" {
  config_path = "../ec2"
}

inputs = {}