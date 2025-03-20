resource "aws_instance" "my_ec2_instance" {
  ami = var.ami_value
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  root_block_device {
    volume_size = var.volume_size
  }

  tags = merge(
    var.tags,
    {
      Environment = "Production"
      name = "Sachin-dev-ec2-instance"
    }

  )
}