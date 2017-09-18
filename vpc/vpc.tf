resource "aws_vpc" "mesh-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = "true"
  
  tags {
    Name = "mesh-vpc"
  }
}

output "id" {
  value = "${aws_vpc.mesh-vpc.id}"
}