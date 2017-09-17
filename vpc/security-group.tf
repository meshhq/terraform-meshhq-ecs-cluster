resource "aws_security_group" "mesh-vpc-security-group" {
    name        = "mesh-vpc-security-group"
    description = "Allow all in an out"
    vpc_id = "${aws_vpc.mesh-vpc.id}"

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

     // Allow All Egress
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Name = "mesh-vpc-security-group"
    }
}