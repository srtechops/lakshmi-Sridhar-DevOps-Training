resource "aws_instance" "myinstance1" {
      ami = "ami-0521bc4c70257a054"
      instance_type = "t2.micro"
      security_groups = ["ssh_allow"]
      tags = {
        "Name" = "RedHat Linux"
      }
      key_name = "redhatkey"
      user_data = <<-EOT
                   #!/bin/bash
                   yum install git -y
                   yum install nano -y
                   useradd Lakshmi
                   mkdir DevOps
                   EOT
}