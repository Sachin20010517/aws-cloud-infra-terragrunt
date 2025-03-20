variable "region" {}

variable "aws_region" {
  description = "The AWS region to create resources in"
  default     = "us-east-1"
}

variable "ami_value" {
    description = "value for the ami"
}

variable "instance_type" {
  description = "value for instance_type"
  default = "t2.micro"
}

variable "vpc_id" {
  description = "The ID of the existing VPC"
  type        = string
}

variable "subnet_id" {
  description = "value for subnet_id"
}

variable "key_name" {
  description = "value for key_name"
}

variable "vpc_security_group_ids" {
  description = "vpc_security_group_ids"
}

variable "volume_size" {
  description = "The size of the EBS volume in GB"
  //type        = number
  default     = 9
}


variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {
    Environment = "Dev"
    Project     = "CGaaS-EC2-Instance"
  }
}
