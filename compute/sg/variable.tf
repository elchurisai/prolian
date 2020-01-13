variable "name" {}

variable "instance_count" {}

variable "vpc_id" {}

#variable "tags"  {}


variable "to_port" {

default ="22"
}


variable "from_port" {

default = "22"
}


variable "protocol" {

default = "tcp"

}


variable "cidr_blocks" {

type = "list"

}

