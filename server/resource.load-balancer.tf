## LOAD BALANCER
resource "aws_lb" "load_balancer" {
  name               = "james-lb"
  internal           = false
  load_balancer_type = "application" # Which OSI layer does this unwrap to
  subnets            = data.aws_subnets.public_subnets.ids


  enable_deletion_protection = true
}

resource "aws_lb_target_group_attachment" "instance" {
  count            = var.number_of_instances
  target_group_arn = aws_lb_target_group.instance.arn
  target_id        = aws_instance.app_server[count.index].id
  port             = 443
}

resource "aws_lb_target_group" "instance" {
  name     = "james-lb-target-group"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "instance" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = 443
  protocol          = "HTTPS"

  certificate_arn   = aws_acm_certificate_validation.default.certificate_arn


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.instance.arn
  }
}