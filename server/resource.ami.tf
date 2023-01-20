resource "aws_instance" "public_staging" {
  ami                 = "ami-0e34bbddc66def5ac"
  instance_type       = var.app_server_instance_type
  subnet_id           = data.aws_subnets.public_subnets.ids[0]
  key_name            = "testy-2"

  user_data = file("./server/install_wordpress.sh")

  tags = {
    Name = "${var.instance_name}Public"
  }
}

resource "aws_ami_from_instance" "wordpress" {
  name               = "james-wordpress-ami"
  source_instance_id = aws_instance.public_staging.id
}
