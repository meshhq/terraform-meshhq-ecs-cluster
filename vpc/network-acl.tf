resource "aws_network_acl" "mesh-vpc-network-acl" {
    vpc_id = "${aws_vpc.mesh-vpc.id}"
    subnet_ids = ["${aws_subnet.mesh-vpc-subnet1.id}", "${aws_subnet.mesh-vpc-subnet2.id}"]
    
    egress {
        protocol   = "-1"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }

    ingress {
        protocol   = "-1"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }

    tags {
        Name = "mesh-vpc-network-acl"
    }
}

