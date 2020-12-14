resource "aws_ebs_volume" "thinknyx_addtional_volume" {
  availability_zone = var.public_availability_zone
  size = 10
  tags = {
      Name = "thinknyx_ec2_server_public"
  }
}