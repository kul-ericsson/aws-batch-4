resource "aws_vpc" "thinknyx_vpc" {
  cidr_block = "10.86.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags = {
      Name = "thinknyx_vpc"
  }
}