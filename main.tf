provider "aws" {

    region = "${var.region}"
}

data "aws_vpc" "dataprovider" {

id = "${var.vpc_id}"

}


data "aws_availability_zone" "example" {

  name = "us-east-1a" 

}

data "aws_subnet_ids" "subnets" {

vpc_id = "${var.vpc_id}"

 tags = {

 Name = "private"

}

}


data "aws_subnet_ids" "public_subnets" {

vpc_id = "${var.vpc_id}"

 tags = {

 Name = "public"

}

}

/*

module "identical_node_mic_sg" {

source = "./compute/sg"
instance_count = 2
name = "identical_node_sg"
vpc_id = "${var.vpc_id}"
#tags = "${var.tags}"

cidr_blocks = ["0.0.0.0/0"]
from_port = "22"
to_port = "22"


}


module "identical_node_nic" {

source = "./compute/nic"
instance_count = "${var.identical_node_count}"
subnet_id = "${data.aws_subnet_ids.subnets.ids}"
name = "identical_node_nic"
tags = "${var.tags}"
}





module "identical_node_nic_sg_attachment" {

source = "./compute/sg_attachment"
instance_count = "${var.identical_node_count}"
security_group_id = "${module.identical_node_mic_sg.mysgid}"
network_interface_id = "${module.identical_node_nic.nic_id}"




}



# Creation of ec2 instance 

module "identical_node_ec2" {

source = "./compute/ec2"
instance_count = "${var.identical_node_count}"
ami = "${var.ami_id}"
name = "identical_node_ec2"
#avaiability_zone = "${data.aws_avaiability_zone.example.*.names}"
disable_api_termination = "false"
instance_type = "${var.instance_type}"
key_name = "virgina"
network_interface = "${module.identical_node_nic.nic_id}"
tags = "${var.tags}"






}

*/


/*  

Creating public security group 

*/




module "public_node_mic_sg" {

source = "./compute/sg"
instance_count = 2
name = "public_node_sg"
vpc_id = "${var.vpc_id}"
#tags = "${var.tags}"

cidr_blocks = ["0.0.0.0/0"]
from_port = "22"
to_port = "22"
}

module "public_node_mic_sg2" {

source = "./compute/sg"
instance_count = 2
name = "public_node_sg"
vpc_id = "${var.vpc_id}"
#tags = "${var.tags}"

cidr_blocks = ["0.0.0.0/0"]
from_port = "80"
to_port = "80"
}
    
    
    

module "public_node_nic" {

source = "./compute/nic"
instance_count = "2"
subnet_id = "${data.aws_subnet_ids.public_subnets.ids}"
name = "public_node_nic"
tags = "${var.tags}"
}



module "public_node_nic_sg_attachment" {

source = "./compute/sg_attachment"
instance_count = "2"
security_group_id = "${module.public_node_mic_sg.mysgid}"
network_interface_id = "${module.public_node_nic.nic_id}"




}



module "public_node_ec2" {

source = "./compute/ec2"
instance_count = "2"
ami = "${var.ami_id}"
name = "public_node_ec2"
#avaiability_zone = "${data.aws_avaiability_zone.example.*.names}"
disable_api_termination = "false"
instance_type = "${var.instance_type}"
key_name = "virgina"
network_interface = "${module.public_node_nic.nic_id}"
tags = "${var.tags}"






}


module "public_node_eip" {

source = "./compute/eip"
instance = "${module.public_node_ec2.instance_id}"
instance_count = "2"

name = "public_eip"

tags = "${var.tags}"

}




/*
module "windows_node_mic_sg" {

source = "./compute/sg"
instance_count = 1
name = "windows_node_sg"
vpc_id = "${var.vpc_id}"
#tags = "${var.tags}"

cidr_blocks = ["123.123.123.123/32" , "123.123.123.15/32"]
from_port = "3389"
to_port = "3389"


}


module "sample_node_mic_sg" {

source = "./compute/sg"
instance_count = 1
name = "sample_node_sg"
vpc_id = "${var.vpc_id}"
cidr_blocks = ["123.123.123.123/32","123.123.123.15/32"]
from_port = "22"
to_port = "22"

#tags = "${var.tags}"

}

*/
