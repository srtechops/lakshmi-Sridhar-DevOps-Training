resource "aws_vpc" "srtechops" {
  cidr_block       = var.CIDR_BLOCK
  instance_tenancy = "default"
  tags = {
    Name = "srtechops"
  }
}