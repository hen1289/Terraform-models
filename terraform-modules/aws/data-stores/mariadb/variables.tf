variable "region" {
  default = "us-east-1"
}

variable "availability_zone" {
  default = "c"
}

variable "name" {
  default = "mariadb"
}

variable "ami" {
  default = "ami-d5bf2caa" // CentOS 7
}

variable "data_volume_device_list" {
  description = "Device list for EC2 mapping"
  default     = ["/dev/sdf", "/dev/sdg", "/dev/sdh"]
}

variable "instance_type" {
  default = "m5.xlarge"
}

variable "key_name" {
  default = "default"
}

variable "main_disk_size" {
  default = 50
}

variable "data_disks_count" {
  default = 1
}

variable "data_disks_size" {
  default = 0
}

variable "logs_disk_size" {
  default = 0
}

variable "backups_disk_size" {
  default = 0
}
