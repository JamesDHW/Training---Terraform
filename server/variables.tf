variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "JamesWordpressInstance"
}

variable "vpc_id" {
  description = "Id of training VPC"
  type        = string
}

variable "app_server_instance_type" {
  default = "t2.micro"
}

variable "number_of_instances" {
  default = 2
}

