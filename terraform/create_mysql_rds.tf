resource "aws_db_subnet_group" "thinknyx_db_subnet_group" {
  name = "thinknyx_db_subnet_group"
  subnet_ids = [ aws_subnet.thinknyx_subnet_public.id, aws_subnet.thinknyx_subnet_public_2.id ]
  tags = {
    "Name" = "thinknyx_db_subnet_group"
  }
}

resource "aws_db_instance" "thinknyx_mysql_db" {
    allocated_storage = 10
    storage_type = "gp2"
    engine = "mysql"
    engine_version = "8.0.20"
    instance_class = "db.t2.micro"
    name = "thinknyx_mysql_db"
    username = "admin"
    password = "admin123"
    identifier = "kul-db"
    availability_zone = var.public_availability_zone
    db_subnet_group_name = aws_db_subnet_group.thinknyx_db_subnet_group.id
    vpc_security_group_ids = [ aws_security_group.thinknyx_vpc_default.id ]
    publicly_accessible = "true"
    skip_final_snapshot = "true"
}