resource "aws_instance" "myinstance" {
  ami           = var.AMI_ID
  instance_type = var.INSTANCE_TYPE
  key_name = var.KEY_PAIR
  tags = {
    Name = var.INSTANCE_NAME
  
  }
  security_groups = ["ssh_allow","http_allow"]
}


