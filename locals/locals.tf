locals {
    instance_name ="${var.name}-${var.environment}"   #locals-dev
    instance_type = "t3.micro" # this value cannot be changed if any user given any value in varaiables
    common_tags ={
        Project = "roboshop"
        Terraform = true
        Environment = "dev"
    }
    ec2_final_tags = merge(local.common_tags,var.ec2_tags)
    ami_id           = "data.aws_ami.joindevops.id"
}