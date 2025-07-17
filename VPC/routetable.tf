resource "aws_route_table" "srtechops_pub_rt" {
  vpc_id = aws_vpc.srtechops.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.srtechops_igw.id
  }

  tags = {
    Name = "srtechops_public_rt"
  }
}