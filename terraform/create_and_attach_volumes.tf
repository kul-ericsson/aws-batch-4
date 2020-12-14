resource "aws_ebs_volume" "thinknyx_addtional_volume" {
  availability_zone = "us-east-2a"
  size = 10
  tags = {
      Name = "thinknyx_ec2_server_public"
  }
}