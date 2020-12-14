resource "aws_vpc" "thinknyx_vpc" {
  cidr_block = "10.86.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags = {
      Name = "thinknyx_vpc"
  }
}

resource "aws_subnet" "thinknyx_subnet_public" {
  vpc_id = aws_vpc.thinknyx_vpc.id
  cidr_block = "10.86.10.0/24"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "thinknyx_subnet_public"
  }
  availability_zone = "us-east-2a"
}

resource "aws_subnet" "thinknyx_subnet" {
  vpc_id = data.aws_vpc.thinknyx_vpc.id
  cidr_block = "10.86.17.0/24"
  map_public_ip_on_launch = false
  tags = {
    "Name" = "thinknyx_subnet_kul"
  }
  availability_zone = "us-east-2a"
}

resource "aws_internet_gateway" "thinknyx_internet_gateway" {
  vpc_id = aws_vpc.thinknyx_vpc.id
  tags = {
    "Name" = "thinknyx_internet_gateway"
  }
}

resource "aws_route_table" "thinknyx_route_table_public" {
  vpc_id = aws_vpc.thinknyx_vpc.id
  tags = {
    "Name" = "thinknyx_route_table_public"
  }
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.thinknyx_internet_gateway.id
  }
}

resource "aws_route_table_association" "thinknyx_route_table_association_public" {
  subnet_id = aws_subnet.thinknyx_subnet_public.id
  route_table_id = aws_route_table.thinknyx_route_table_public.id
}