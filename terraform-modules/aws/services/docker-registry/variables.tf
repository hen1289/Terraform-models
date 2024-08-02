variable "region" {
  default = "us-east-1"
}

variable "availability_zone" {
  default = "c"
}

variable "name" {
  default = "docker-registry"
}

variable "ami" {
  default = "ami-d5bf2caa" // CentOS 7
}

variable "instance_type" {
  default = "t3a.small"
}

variable "key_name" {
  default = "default"
}

variable "main_disk_size" {
  default = 10
}

variable "data_disk_size" {
  default = 80
}
