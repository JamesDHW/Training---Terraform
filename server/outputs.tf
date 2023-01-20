output "instance_id" {
  description = "IDs of the EC2 instance"
  value       = join(", ", aws_instance.app_server[*].id)
}

output "instance_public_ip" {
  description = "Public IP addresses of the EC2 instance"
  value       = join(", ", aws_instance.app_server[*].public_ip)
}

output "subnet_id" {
  description = "ids of instance subnet"
  value       = join(", ", aws_instance.app_server[*].subnet_id)
}