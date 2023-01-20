data "aws_subnets" "private_subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

    filter {
        name   = "tag:Attributes"
        values = ["private"]
    }
}

data "aws_subnets" "public_subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

    filter {
        name   = "tag:Attributes"
        values = ["public"]
    }
}

data "aws_route53_zone" "primary" {
  name         = "training.theo.do"
}