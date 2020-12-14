provider "aws" {
  region = "us-east-2"
}

provider "mysql" {
  endpoint = aws_db_instance.thinknyx_mysql_db.endpoint
  username = aws_db_instance.thinknyx_mysql_db.username
  password = aws_db_instance.thinknyx_mysql_db.password
}