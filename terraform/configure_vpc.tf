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