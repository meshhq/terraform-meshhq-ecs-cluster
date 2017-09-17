resource "aws_internet_gateway" "mesh-vpc-internet-gateway" {
  vpc_id = "${aws_vpc.mesh-vpc.id}"

  tags {
    Name = "mesh-vpc-internet-gateway"
  }
}