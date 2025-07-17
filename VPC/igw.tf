resource "aws_internet_gateway" "srtechops_igw" {
  vpc_id = aws_vpc.srtechops.id

  tags = {
    Name = "srtechops_igw"
  }
}