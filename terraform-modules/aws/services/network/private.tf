resource "aws_subnet" "subnet_private_1a" {

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.32.1.0/24"
  availability_zone = format("%sa", var.region)

  tags = {
    Name                                        = format("%s-subnet-private-1a", var.vpc_name)
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

resource "aws_subnet" "subnet_private_1b" {

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.32.2.0/24"
  availability_zone = format("%sb", var.region)

  tags = {
    Name                                        = format("%s-subnet-private-1b", var.vpc_name)
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

resource "aws_route_table_association" "subnet_private_1a" {
  subnet_id      = aws_subnet.subnet_private_1a.id
  route_table_id = aws_route_table.nat_rt.id
}

resource "aws_route_table_association" "subnet_private_1b" {
  subnet_id      = aws_subnet.subnet_private_1b.id
  route_table_id = aws_route_table.nat_rt.id
}