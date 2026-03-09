resource "aws_instance" "example" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
   
   provisioner "local-exec" {
    command = "echo ${self.public_ip} > inventory.ini"
  }
   provisioner "local-exec" {
    command    = "exit 1"
    on_failure = continue
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Deleting the instance'"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo ' ' > inventory.ini"
  }

connection {
    type        = "ssh"
    user        = "ec2-user"
    password = "DevOps321"
    host        = self.public_ip
    timeout     = "5m"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }

provisioner "remote-exec" {
    inline = [
      "sudo systemctl disable nginx",
      "sudo systemctl stop nginx"
    ]
    when = destroy
  }

  
  tags = {
    Name = "provisioners-demo-1"
    project = "roboshop"

  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_all_terraform"    # this is for aws account 
  description = "Allow TLS inbound traffic and all outbound traffic"
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_all_terraform"
  }
}
