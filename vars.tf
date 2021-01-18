variable "AWS_REGION"{
    default = "us-east-2"
}
variable "PATH_TO_PRIVATE_KEY" {
    default = "gopalkey"
}
variable "PATH_TO_PUBLIC_KEY" {
    default = "gopalkey.pub"
}

variable "AMIS"{
    type = map(string)
    default = {
    us-east-1 = "ami-0be2609ba883822ec "
    us-east-2 = "ami-0a0ad6b70e61be944"
    us-west-1 = "ami-03130878b60947df3"
    us-west-2 = "ami-0a36eb8fadc976275"
    }
}
variable "INSTANCE_DEVICE_NAME" {
    default = "/dev/xvdh"
}