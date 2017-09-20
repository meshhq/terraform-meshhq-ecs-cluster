resource "aws_ecs_task_definition" "mesh-sample-definition" {
    family                = "mesh-sample-definition"
    container_definitions = "${file("./ecs/task-definition.json")}"
}