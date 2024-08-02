variable "region" {
  default = "us-east-1"
}

variable "availability_zone" {
  default = "c"
}

variable "name" {
  default = "mongodb"
}

variable "ami" {
  default = "ami-d5bf2caa" // CentOS 7
}

variable "instance_type" {
  default = "t3a.4xlarge"
}

variable "key_name" {
  default = "default"
}

variable "main_disk_size" {
  default = 20
}

variable "data_disk_size" {
  default = 80
}
