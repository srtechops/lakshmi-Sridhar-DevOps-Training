resource "aws_db_instance" "srtechops_db" {
  allocated_storage    = 10
  db_name              = "srtechopsstudentsdb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "admin123"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.allow_mysql_port.id]
  db_subnet_group_name = "srtechops_db_subnet_group"
}