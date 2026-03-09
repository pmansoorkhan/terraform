resource "aws_instance" "example" {
  ami           = "data.aws_instance.joindevops.id"
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
  tags = merge(
    var.common_tags,
    var.ec2_tags
  )
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_all_terraform"    # this is for aws account 
  #description = "Allow TLS inbound traffic and all outbound traffic"
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description = "Allow TLS inbound traffic and all outbound traffic"
  }

   dynamic "ingress" {
     for_each =var.ingress_rules
     content{
       from_port = ingress.value.port
       to_port = ingress.value.port
       protocol ="tcp"
       cidr_blocks = ingress.value.cidr_blocks
       description = "ingress.value.description"
    }
    
  }

  tags = merge(
    var.common_tags,
    var.sg_tags
  )
}
