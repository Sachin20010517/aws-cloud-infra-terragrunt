resource "aws_s3_bucket" "example" {
  bucket = "sachinnnnn-tf-test-bucket"
  # region = var.region_2
  

  tags = {
    Name        = "Sachin bucket"
    Environment = "test"
  }
}