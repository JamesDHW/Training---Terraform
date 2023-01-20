resource "aws_db_instance" "default" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.blog_db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.default.name
}


resource "aws_security_group" "blog_db_sg" {
  description = "Security group for blog database"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Inbound to database"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    # cidr_blocks      = [aws_vpc.main.cidr_block]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description      = "Outbound to entire internet"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

# Define egress/ ingress from security group not cidr block
resource "aws_db_subnet_group" "default" {
  name       = "jameshw_db"
  subnet_ids = data.aws_subnets.private.ids
}
