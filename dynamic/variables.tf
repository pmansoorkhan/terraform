 variable "ingress_rules" {
    default = [
        {
         port =22
         cidr_blocks =["0.0.0.0/0"]
        },
        {
          port =3306
          cidr_blocks =["0.0.0.0/0"]
        },
        {
         port =443
         cidr_blocks =["0.0.0.0/0"]
        }
    ]
 }