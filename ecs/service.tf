variable "ecs-service-role-arn" {}

resource "aws_ecs_service" "mesh-ecs-service" {
  name            = "mesh-ecs-service"
  cluster         = "${aws_ecs_cluster.mesh-ecs-cluster.id}"
  task_definition = "${aws_ecs_task_definition.mesh-sample-definition.arn}"
  iam_role        = "${aws_iam_role.ecs-service-role-arn}"
  desired_count   = 1
}