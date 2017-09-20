resource "aws_ecs_cluster" "mesh-ecs-cluster" {
    name = "${var.ecs-cluster-name}"
}