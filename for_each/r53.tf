resource "aws_route53_record" "www" {
    for_each=aws_instance.example
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}"  # mongodb.shannu.online 
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]  
}
#alow_overwrite = true

# roboshop.shannu.online
resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = "roboshop.${var.domain_name}"  # mongodb.shannu.online 
  type    = "A"
  ttl     = 1
  records = [lookup(aws_instance.example,"frontend").public_ip]
  alow_overwrite = true  
}