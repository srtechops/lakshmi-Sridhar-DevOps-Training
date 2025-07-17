resource "aws_subnet" "pub_subnet_a" {
  vpc_id     = aws_vpc.srtechops.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "pub_subnet_a"
  }
  map_public_ip_on_launch = true
}

resource "aws_subnet" "pub_subnet_b" {
  vpc_id     = aws_vpc.srtechops.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "pub_subnet_b"
  }
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet_a" {
  vpc_id     = aws_vpc.srtechops.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "private_subnet_a"
  }
  map_public_ip_on_launch = false
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id     = aws_vpc.srtechops.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "private_subnet_b"
  }
  map_public_ip_on_launch = false
}