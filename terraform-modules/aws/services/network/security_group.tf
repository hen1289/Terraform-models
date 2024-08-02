resource "aws_security_group" "sg" {
 name = var.sg_name
 description = "Default SG"
 vpc_id = aws_vpc.vpc.id

 ingress { 
  description = "internal-traffic"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["192.168.0.0/16"]
 }

 ingress { 
  description = "internal-traffic"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["10.212.0.0/16"]
 }

 ingress { 
  description = "internal-traffic"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["10.20.0.0/23"]
 }
 
 ingress { 
  description = "internal-traffic"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["10.211.0.0/16"]
 }

 ingress { 
  description = "internal-traffic"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["172.32.0.0/16"]
 }

 ingress { 
  description = "SSH"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["172.32.0.0/16","10.211.0.0/16","10.20.0.0/23","10.212.0.0/16","192.168.0.0/16"]
 }

 ingress { 
  description = "HTTP"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
 }

 ingress { 
  description = "HTTPS"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
 }

 ingress { 
  description = "okd-console"
  from_port = 8443
  to_port = 8443
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
 }
 
 egress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
 }
 
 tags = {
  Name = var.sg_name
 }
}