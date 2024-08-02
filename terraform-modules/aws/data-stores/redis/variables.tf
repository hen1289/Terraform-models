variable "region" {
  default = "us-east-1"
}

variable "availability_zone" {
  default = "c"
}

variable "name" {
  default = "redis"
}

variable "ami" {
  default = "ami-d5bf2caa" // CentOS 7
}

variable "instance_type" {
  default = "m5.large"
}

variable "key_name" {
  default = "default"
}

variable "main_disk_size" {
  default = 16
}
