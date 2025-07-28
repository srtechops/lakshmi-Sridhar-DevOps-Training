resource "aws_route_table" "srtechops_private_rt" {
  vpc_id = aws_vpc.srtechops_vpc.id

  tags = {
    Name = "srtechops_private_rt"
  }
}