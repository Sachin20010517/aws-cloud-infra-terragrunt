locals {
  default_yaml_path = find_in_parent_folders("empty.yaml")
#   org               = yamldecode(file(find_in_parent_folders("org.yaml")))
  account           = yamldecode(file(find_in_parent_folders("accounts/account.yaml")))
  region            = yamldecode(file(find_in_parent_folders("region.yaml")))
  environment       = yamldecode(file(find_in_parent_folders("environment.yaml", local.default_yaml_path)))
}

# Generate AWS provider configuration
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.region.region}"
  profile = "${local.account.profile}"
}
EOF
}

# Configure remote state backend
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = "${local.account.state_bucket}"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "${local.region.region}"
    encrypt        = true
    dynamodb_table = "${local.account.state_lock_table}"
  }
}

# Merge inputs from different YAML files
inputs = merge(
  #local.org,
  local.account,
  local.region,
  local.environment
)