data "aws_ami" "thinknyx_ami" {
  owners = [ "554660509057" ]
  filter {
    name = "name"
    values = ["ericsson-batch-4-kul"]
  }
}

output "thinknyx_ami" {
  value = data.aws_ami.thinknyx_ami.id
}