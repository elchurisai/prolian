output "nic_id" {

  value = "${aws_network_interface.test.*.id}"

}


output "subnet_id" {

  value = "${aws_network_interface.test.*.subnet_id}"

}


output "private_ips" {

  value = "${aws_network_interface.test.*.private_ips}"

}




