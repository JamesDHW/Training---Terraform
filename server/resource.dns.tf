## AUTHORITATIVE DNS RECORD
resource "aws_route53_record" "a_name" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "james"
  type    = "CNAME"
  ttl     = 60
  records = [ aws_lb.load_balancer.dns_name ]
}


# ACM
# Prove that I own my DNS name
# Attach certificate to the listener
# Update ports to 443

resource "aws_acm_certificate" "default" {
  domain_name = "james.training.theo.do"
  validation_method = "DNS"
}

resource "aws_acm_certificate_validation" "default" {
  certificate_arn         = aws_acm_certificate.default.arn
  validation_record_fqdns = [for record in aws_route53_record.validation : record.fqdn]
}

resource "aws_route53_record" "validation" {
  for_each = {
    for dvo in aws_acm_certificate.default.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }


  zone_id = data.aws_route53_zone.primary.zone_id
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
}
