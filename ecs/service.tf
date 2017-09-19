resource "aws_ecs_service" "mesh-ecs-service" {
  name            = "${var.ecs-service-name}"
  cluster         = "${aws_ecs_cluster.mesh-ecs-cluster.id}"
  task_definition = "${aws_ecs_task_definition.mesh-sample-definition.arn}"
  # iam_role        = "${var.ecs-service-role-arn}"
  desired_count   = 1
}