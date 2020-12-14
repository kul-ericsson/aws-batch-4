resource "mysql_database" "thinknyx_db" {
  name = "thinknyx_from_terraform"
}

resource "mysql_user" "thinknyx_dbuser" {
	user = "kmayer"
	plaintext_password = "india@123"
	host = aws_instance.thinknyx_ec2_server_public.private_ip
}

resource "mysql_grant" "dbgrant" {
	user = mysql_user.thinknyx_dbuser.user
	host = mysql_user.thinknyx_dbuser.host
	database = mysql_database.thinknyx_db.name
	privileges = ["SELECT","UPDATE","INSERT","CREATE","DROP","DELETE"]
}