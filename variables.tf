variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
}

variable "target_vpc_tag" {
  description = "Tag of the VPC we want to deploy our subnet to"
  default     = { Name = "training" }
}