resource "aws_instance" "thinknyx_ec2_server" {
  ami = data.aws_ami.thinknyx_ami.id
  instance_type = "t2.micro"
  key_name = "ericsson-batch-4-kul"
  tags = {
    "Name" = "thinknyx_ec2_server"
  }
  subnet_id = aws_subnet.thinknyx_subnet.id
}

resource "aws_instance" "thinknyx_ec2_server_public" {
  ami = data.aws_ami.thinknyx_ami.id
  instance_type = "t2.micro"
  key_name = "ericsson-batch-4-kul"
  tags = {
    "Name" = "thinknyx_ec2_server_public"
  }
  subnet_id = data.aws_subnet.thinknyx_public_subnet.id
}