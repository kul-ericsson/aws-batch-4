output "thinknyx_ami" {
  value = data.aws_ami.thinknyx_ami.id
}

output "thinknyx_ec2_server_public_ip" {
  value = aws_instance.thinknyx_ec2_server.public_ip
}

output "thinknyx_ec2_server_public_public_ip" {
  value = aws_instance.thinknyx_ec2_server_public.public_ip
}

output "thinknyx_vpc" {
  value = data.aws_vpc.thinknyx_vpc.id
}

output "thinknyx_addtional_volume_id" {
  value = aws_ebs_volume.thinknyx_addtional_volume.id
}