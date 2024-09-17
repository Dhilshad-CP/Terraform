resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = var.vpc_Name
  }
}

resource "aws_subnet" "pub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pub_cidr_block
  map_public_ip_on_launch = true
  tags = {
    Name = var.pub_Name
  }
}

resource "aws_subnet" "pri" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pri_cidr_block
  map_public_ip_on_launch = true
  tags = {
    Name = var.pri_Name
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.igw_Name
  }
}

resource "aws_route_table" "myroute_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.route_cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.route_Name
  }
}

resource "aws_route_table_association" "example_association" {
  subnet_id      = aws_subnet.pub.id
  route_table_id = aws_route_table.myroute_table.id
}

resource "aws_security_group" "mysg" {
  vpc_id = aws_vpc.main.id
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.ig_cidr_blocks]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.port_cidr_blocks]
  }

  tags = {
    Name = var.sg_Name
  }
}
