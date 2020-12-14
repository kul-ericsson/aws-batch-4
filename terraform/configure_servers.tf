resource "null_resource" "configure_servers" {
  provisioner "remote-exec" {
    connection {
        type = "ssh"
        user = "centos"
        host = aws_instance.thinknyx_ec2_server_public.public_ip
        private_key = file("c:/training/ericsson/aws/batch-4/ericsson-batch-4-kul.pem")
    }
    inline = [
        "lsblk",
        "sudo yum install -y nfs-utils",
        "sudo mkdir /data",
        "sudo mkfs -t ext4 /dev/xvdb",
        "sudo mount /dev/xvdb /data",
        "sudo chown centos:users /data",
        "sudo echo 'This Entry is done from Provisioner' >> /data/demo",
        "lsblk"
    ]
  }
}