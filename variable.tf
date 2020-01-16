variable "tags"  {

default = {

Terraform = "true"
Environment = "dev"

}
}

variable "identical_node_count" {

default = 4 
}



variable "region" {

    default ="us-east-1"
}

variable "ami_id" {

default = "ami-07ebfd5b3428b6f4d"
}

variable "vpc_id" {

    default  = "vpc-be7355c4"
}

variable "instance_type" {}



