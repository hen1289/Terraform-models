variable "region" {
  default = "us-east-1"
}

variable "az_map" {
  default = {
    1 = "a"
    2 = "b"
  }
}

variable "availability_zone" {
  default = "a"
}

variable "multiple_az" {
  default = false # valid for < 7 instances per group
}

variable "name" {
  default = "openshift"
}

variable "cluster_name" {
  default = "openshift"
}

variable "ami" {
  default = "ami-d5bf2caa" // CentOS 7
}

variable "instance_type" {
  default = "c5.4xlarge"
}

variable "key_name" {
  default = "default"
}

variable "instance_count" {
  default = 1
}

variable "main_disk_size" {
  default = 20
}

variable "docker_pool_disk_size" {
  default = 40
}

variable "var_disk_size" {
  default = 80
}

variable "is_load_balancer" {
  default = false
}

variable "vpc_security_group_ids" {}

variable "subnet_id" {}
