resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.srtechops_public_subnet.id
  route_table_id = aws_route_table.srtechops_pub_rt.id
}


resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.srtechops_private_subneta.id
  route_table_id = aws_route_table.srtechops_private_rt.id
}


resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.srtechops_private_subnetb.id
  route_table_id = aws_route_table.srtechops_private_rt.id
}