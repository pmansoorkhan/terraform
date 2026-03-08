variable "common_tags"{
    default ={
        Project = "roboshop"
        Terraform = true
        Environment = "dev"
    }   
}

variable "ec2_tags"{
    default={
        Name = "functions-demo"
        Environment ="Prod"
        prepared = "Mansoor"
    }
}
variable "sg_tags"{
    default={
      Name = "functions-demo"
       prepared = "Mansoor"  
    }
}