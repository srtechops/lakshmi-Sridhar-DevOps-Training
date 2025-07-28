resource "aws_security_group" "allow_mysql_port" {
  name        = "allow_mysql_port"
  description = "Allow Mysql port inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.srtechops_vpc.id

  tags = {
    Name = "allow_mysql_port"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_mysql_ipv4" {
  security_group_id = aws_security_group.allow_mysql_port.id
  cidr_ipv4         = aws_subnet.srtechops_public_subnet.cidr_block
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
}



resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_mysql" {
  security_group_id = aws_security_group.allow_mysql_port.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}