data "aws_vpc" "target_vpc" {
    tags = var.target_vpc_tag
}