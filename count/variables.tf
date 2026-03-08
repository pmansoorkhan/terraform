variable "instances" {
    type = list
    default = ["mongodb", "rabbitmq", "mysql", "cart", "catalogue", "shipping", "user", "payment", "frontend", "redis"]
}


variable "zone_id"{
    default = "Z01032422UQPZQPC0HZ2Q"
}

variable "domain_name"{
    default = "shannu.online"
}

variable "teams"{
    type = list(string)
    default = ["wintel", "vmware", "linux", "database", "vmware", "sql"]
}

variable "teams_set"{
    type = set(string)
    default = ["wintel", "vmware", "linux", "database", "vmware", "sql"]
}