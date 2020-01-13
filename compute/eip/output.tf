output "eip_id" {

value = "${aws_eip.my_eip.*.id}"
}


output "eip_public_ip" {

value = "${aws_eip.my_eip.*.public_ip}"
}

