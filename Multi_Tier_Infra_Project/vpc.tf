resource "aws_vpc" "srtechops_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "srtechops_vpc"
  }
}