resource "aws_instance" "Webserver" {
  ami           = var.AMI_ID
  instance_type = var.INSTANCE_TYPE
  key_name = var.KEY_PAIR
  tags = {
    Name = var.INSTANCE_NAME
  
  }
   vpc_security_group_ids = ["sg-0833d91ee14a8b057"]
  subnet_id = aws_subnet.pub_subnet_a.id
}



resource "aws_instance" "DBserver" {
  ami           = var.AMI_ID
  instance_type = var.INSTANCE_TYPE
  key_name = var.KEY_PAIR
  tags = {
    Name = var.INSTANCE_NAME
  
  }
   vpc_security_group_ids = ["sg-0833d91ee14a8b057"]
  subnet_id = aws_subnet.private_subnet_a.id
}



