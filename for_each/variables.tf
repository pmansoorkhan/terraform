#Map 
/*variable "instances" {
    type = map
    default = {
      mongodb = "t3.micro"
      cart = "t3.small"
      catalogue = "t3.micro"
      shipping = "t3.small"
    
    }

}*/

# This should be converted into set 
variable "instances" {
    type = list
    default = ["rabbitmq", "mysql"]
}

variable "zone_id"{
    default = "Z01032422UQPZQPC0HZ2Q"
}

variable "domain_name"{
    default = "shannu.online"
}