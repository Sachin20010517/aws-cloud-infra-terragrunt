# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket         = "iamsachin-terraform-bucket"
    dynamodb_table = "terraform-lock"
    encrypt        = true
    key            = "environments/test/s3/my-test-s3/terraform.tfstate"
    region         = "us-east-1"
  }
}
