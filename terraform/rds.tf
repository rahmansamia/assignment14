resource "aws_db_instance" "app_db" {
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  db_name              = "appdb"
  username             = "admin"
  password             = "jgj9nbfg435nnfdgh"
  publicly_accessible  = false
}
