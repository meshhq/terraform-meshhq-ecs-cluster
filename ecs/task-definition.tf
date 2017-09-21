resource "aws_ecs_task_definition" "mesh-task-definition" {
    family                = "mesh-task-definition"
    container_definitions = "${file("./ecs/task-definition.json")}"
}