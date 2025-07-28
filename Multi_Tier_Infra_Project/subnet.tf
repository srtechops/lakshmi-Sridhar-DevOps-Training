resource "aws_subnet" "srtechops_public_subnet" {
  vpc_id     = aws_vpc.srtechops_vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "srtechops_public_subnet"
  }
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1a"
}


resource "aws_subnet" "srtechops_private_subneta" {
  vpc_id     = aws_vpc.srtechops_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "srtechops_private_subneta"
  }
  map_public_ip_on_launch = false
  availability_zone = "ap-south-1a"
}


resource "aws_subnet" "srtechops_private_subnetb" {
  vpc_id     = aws_vpc.srtechops_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "srtechops_private_subnetb"
  }
  map_public_ip_on_launch = false
  availability_zone = "ap-south-1b"
}