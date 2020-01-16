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

output "public_node_ec2" {

  value = "${module.public_node_ec2.instance_id}"

}

/*
output "sample_node_mic_sg" {

  value = "${module.sample_node_mic_sg.mysgid}"

}


output "sample_node_mic_sg_arn" {

  value = "${module.sample_node_mic_sg.sgarn}"

}
*/
