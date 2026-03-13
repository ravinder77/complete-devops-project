
variable "name" {
  type = string
}

variable "engine" {
  type = string
  default = "postgres"
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "allocated_storage" {
  type = number
  default = 20
}

variable "database_name" {
  type = string
}

variable "master_username" {
  type    = string
  default = "dbadmin"
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "multi_az" {
  type    = bool
  default = true
}

variable "backup_retention" {
  type    = number
  default = 7
}

variable "environment" {
  type = string
}