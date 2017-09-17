resource "aws_ecs_service" "mesh-ecs-service" {
  name            = "mesh-ecs-service"
  cluster         = "${aws_ecs_cluster.mesh-ecs-cluster.id}"
  task_definition = "${aws_ecs_task_definition.mesh-sample-definition.arn}"
  desired_count   = 1
}