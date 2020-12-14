data "aws_ami" "thinknyx_ami" {
  owners = [ "554660509057" ]
  filter {
    name = "name"
    values = ["ericsson-batch-4-kul"]
  }
}

data "aws_vpc" "thinknyx_vpc" {
  id = "vpc-0df3356130c95009c"
}

resource "aws_instance" "thinknyx_ec2_server" {
  ami = data.aws_ami.thinknyx_ami.id
  instance_type = "t2.micro"
  key_name = "ericsson-batch-4-kul"
  tags = {
    "Name" = "thinknyx_ec2_server"
  }
}

output "thinknyx_ami" {
  value = data.aws_ami.thinknyx_ami.id
}

output "thinknyx_ec2_server_public_ip" {
  value = aws_instance.thinknyx_ec2_server.public_ip
}

output "thinknyx_vpc" {
  value = data.aws_vpc.thinknyx_vpc.id
}