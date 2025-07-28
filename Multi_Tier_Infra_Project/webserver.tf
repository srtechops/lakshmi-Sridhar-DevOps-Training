resource "aws_instance" "myinstance1" {
      ami = "ami-0d0ad8bb301edb745"
      instance_type = "t2.micro"
      tags = {
        "Name" = "Amazon Linux"
      }
      key_name = "redhatkey"
      subnet_id = aws_subnet.srtechops_public_subnet.id
      vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
}


resource "null_resource" "wordpresapp_deploy" {
  depends_on = [aws_instance.myinstance1]
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("C:\\Users\\SHANMUGA RAJA\\Pictures\\awsKey\\redhatkey.pem")
    host        = aws_instance.myinstance1.public_ip
  }

provisioner "remote-exec" {
  inline = [
    # List available PHP modules
    "sudo dnf module list php",

    # Enable PHP 8.2 and install necessary PHP extensions
    "sudo dnf module reset php -y",
    "sudo dnf module enable php:8.2 -y",
    "sudo dnf install -y php php-cli php-mysqlnd php-fpm php-gd php-xml php-mbstring",

    # Install MariaDB 10.5
    "sudo dnf install -y mariadb105 mariadb105-server",

    # Start and enable MariaDB service
    "sudo systemctl enable mariadb",
    "sudo systemctl start mariadb",

    # Install git
    "sudo dnf install -y git",

    # Clone WordPress from GitHub
    "sudo git clone https://github.com/WordPress/WordPress.git /var/www/html",

    # Set correct permissions
    "sudo chown -R apache:apache /var/www/html",

    # Start and enable Apache (httpd)
    "sudo systemctl enable httpd",
    "sudo systemctl start httpd"
  ]
}


}

