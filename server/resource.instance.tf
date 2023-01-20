## EC2 INSTANCE
resource "aws_instance" "app_server" {
  ami                 = aws_ami_from_instance.wordpress.id
  instance_type       = var.app_server_instance_type
  subnet_id           = data.aws_subnets.private_subnets.ids[0]
  count               = var.number_of_instances

  tags = {
    Name = var.instance_name
  }
}