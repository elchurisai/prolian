/* output "identical_node_mic_sg_id" {

  value = "${module.identical_node_mic_sg.mysgid}"

}


output "identical_node_mic_sg_arn" {

  value = "${module.identical_node_mic_sg.sgarn}"

}


output "identical_node_nic_id" {

  value = "${module.identical_node_nic.nic_id}"

}

output "identical_node_nic_subnet_id" {

  value = "${module.identical_node_nic.subnet_id}"

}

*/

output "public_node_instance_id" {

  value = "${module.public_node_ec2.instance_id}"

}

output "public_node_public_ips" {

  value = "${module.public_node_eip.eip_public_ip}"

}

/*
output "sample_node_mic_sg" {

  value = "${module.sample_node_mic_sg.mysgid}"

}


output "sample_node_mic_sg_arn" {

  value = "${module.sample_node_mic_sg.sgarn}"

}
*/
