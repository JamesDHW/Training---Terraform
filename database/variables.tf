variable "db_name" {
  description = "Name of the database"
  default     = "wordpressDB"
}

variable "db_security_group_id" {
  description = "ID of the database security group"
  default     = "wordpress_sg"
}

variable "vpc_id" {
  description = "Id of training VPC"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
}