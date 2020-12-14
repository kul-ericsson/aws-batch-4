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
    vpc_id = data.aws_vpc.thinknyx_vpc.id
    filter {
      name = "tag:Name"
      values = ["thinknyx_subnet_public_2"]
    }
}