resource "aws_route_table" "mesh-vpc-route-table" {
  vpc_id = "${aws_vpc.mesh-vpc.id}"

  route {
    cidr_block = "10.0.0.0/0"
    gateway_id = "${aws_internet_gateway.mesh-vpc-internet-gateway.id}"
  }

  tags {
    Name = "mesh-vpc-route-table"
  }
}

resource "aws_route_table_association" "mesh-vpc-route-table-association1" {
  subnet_id      = "${aws_subnet.mesh-vpc-subnet1.id}"
  route_table_id = "${aws_route_table.mesh-vpc-route-table.id}"
}

resource "aws_route_table_association" "mesh-vpc-route-table-association2" {
  subnet_id      = "${aws_subnet.mesh-vpc-subnet2.id}"
  route_table_id = "${aws_route_table.mesh-vpc-route-table.id}"
}