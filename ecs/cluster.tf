resource "aws_ecs_cluster" "mesh-ecs-cluster" {
    name = "${var.resource-prefix}-cluster"
}

output "cluster-name" {
    value = "${aws_ecs_cluster.mesh-ecs-cluster.name}"
}
