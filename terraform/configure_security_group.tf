resource "aws_security_group" "thinknyx_vpc_default" {
  vpc_id = aws_vpc.thinknyx_vpc.id
  name = "thinknyx_vpc_security_group"
  ingress {
      from_port = 22
      to_port = 22
      cidr_blocks = [ "0.0.0.0/0" ]
      protocol = "tcp"
  }
  ingress {
      from_port = 80
      to_port = 85
      cidr_blocks = [ "0.0.0.0/0" ]
      protocol = "tcp"
  }
  egress {
      from_port = 0
      to_port = 0
      cidr_blocks = [ "0.0.0.0/0" ]
      protocol = "-1"
  }
  tags = {
    "Name" = "thinknyx_vpc_security_group_kul"
  }
}