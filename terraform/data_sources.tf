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

data "aws_subnet" "thinknyx_public_subnet"{
  depends_on = [ aws_subnet.thinknyx_subnet_public ]
  vpc_id = data.aws_vpc.thinknyx_vpc.id
  availability_zone = var.public_availability_zone
  filter {
    name = "tag:Name"
    values = ["thinknyx_subnet_public_kul"]
  }
}