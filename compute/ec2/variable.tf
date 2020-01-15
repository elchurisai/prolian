variable "instance_count" {}

variable "ami" {}


variable "name" {
default = "Instance"

}
/*
variable "avaiability_zone" {


}

*/

variable "disable_api_termination" {}

variable "instance_type" {}

variable "key_name" {}
variable "tags" {

type="map"
}
variable "network_interface" {

type = "list"

}

variable public_ips {}
