resource "aws_instance" "module_ec2" {

count = "${var.instance_count}"
ami = "${var.ami}"
#avaiability_zone = "${data.aws_avaiability_zones.available.*.names}"
disable_api_termination = "${var.disable_api_termination}"
instance_type = "${var.instance_type}"

key_name = "${var.key_name}"
network_interface  {

  network_interface_id = "${element(var.network_interface, count.index)}"
  device_index = 0
  delete_on_termination = "false"

}


# Ansible requires Python to be installed on the remote machine as well as the local machine.
 provisioner "remote-exec" {
   inline = ["sudo apt-get -qq install python -y"]
 }
  
tags = "${merge(map("Name", var.instance_count > 1 ? format("%s-%03d", var.name, count.index+1) : var.name), var.tags)}"

lifecycle {

ignore_changes = ["private_ip" ,"root_block_device","ebs_block_device","tags"]

}


}

