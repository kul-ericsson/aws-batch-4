resource "aws_ebs_volume" "thinknyx_addtional_volume" {
  availability_zone = var.public_availability_zone
  size = 10
  tags = {
      Name = "thinknyx_ec2_server_public"
  }
}

resource "aws_volume_attachment" "thinknyx_attach_volume" {
  volume_id = aws_ebs_volume.thinknyx_addtional_volume.id
  instance_id = aws_instance.thinknyx_ec2_server_public.id
  device_name = "/dev/sdb"
  skip_destroy = true
}