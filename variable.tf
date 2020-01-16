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

default = "ami-04b9e92b5572fa0d1"
}

variable "vpc_id" {

    default  = "vpc-be7355c4"
}

variable "instance_type" {}



