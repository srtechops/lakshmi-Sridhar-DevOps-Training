resource "aws_instance" "Dev" {
  ami = var.AMI_ID
  instance_type = var.INSTANCE_TYPE
  key_name = var.KEY_PAIR
  tags = {
    Name = var.INSTANCE_NAME
  }
   security_groups = ["ssh_allow","http_allow"]

}

resource "aws_ebs_volume" "AdditionalVolume" {
  availability_zone = aws_instance.Dev.availability_zone
  size              = 40

  tags = {
    Name = "New_Volume"
  }

  

}

resource "aws_volume_attachment" "ebs_att" {
  depends_on = [ aws_instance.Dev,aws_ebs_volume.AdditionalVolume ]
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.AdditionalVolume.id
  instance_id = aws_instance.Dev.id


}

resource "null_resource" "test_resource" {
    depends_on = [ aws_volume_attachment.ebs_att ]
    connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("C:/Users/SHANMUGA RAJA/Pictures/awsKey/redhatkey.pem")
    host = aws_instance.Dev.public_ip
  }

  provisioner "remote-exec" {
    inline = [
          "sudo yum install httpd -y",
          "sudo mkfs -t ext4 -F /dev/xvdb",
          "sudo mount /dev/xvdb /var/www/html",
          "echo '<h1>Welcome to terraformclass' | sudo tee /var/www/html/index.html",
          "sudo systemctl enable httpd",
          "sudo systemctl start httpd"


          
    ]
  }
}
 

  