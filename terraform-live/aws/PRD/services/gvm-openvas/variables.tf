variable "region" {
  default = "us-east-1"
}

variable "availability_zone" {
  default = "c"
}

variable "name" {
  default = "proxy"
}

variable "ami" {
  default = "ami-04eaeeccebe0b3495" // Fedora CoreOS 33
}

variable "instance_type" {
  default = "t3a.small"
}

variable "key_name" {
  default = "default"
}

variable "main_disk_size" {
  default = 8
}

variable "data_disk_size" {
  default = 50
}

variable "subnet_id" {}

variable "public_access" {
  default = "false"
}

variable "ssh-key" {
  default = ""
}

variable "tags"{
  default = {
  }
}

variable "script_name" {
  default = "docker-builder"
}


variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
}