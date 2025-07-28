resource "aws_db_subnet_group" "srtechops_db_subnet_group" {
  name       = "srtechops_db_subnet_group"
  subnet_ids = [aws_subnet.srtechops_private_subneta.id, aws_subnet.srtechops_private_subnetb.id]

  tags = {
    Name = "My DB subnet group srtechops"
  }
}