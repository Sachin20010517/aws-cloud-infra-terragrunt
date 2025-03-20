resource "aws_s3_bucket" "example" {
  bucket = "sachinnnnn-tf-test-bucket"

  tags = {
    Name        = "Sachin bucket"
    Environment = "test"
  }
}