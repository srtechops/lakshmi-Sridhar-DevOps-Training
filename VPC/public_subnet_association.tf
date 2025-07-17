resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.pub_subnet_a.id
  route_table_id = aws_route_table.srtechops_pub_rt.id
  }



  resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.pub_subnet_b.id
  route_table_id = aws_route_table.srtechops_pub_rt.id
  }