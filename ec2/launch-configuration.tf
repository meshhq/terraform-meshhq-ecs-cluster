variable "cluster-name" {}
variable "security-group-id" {}

resource "aws_launch_configuration" "mesh-ecs-launch-config" {
    name          = "mesh-ecs-launch-config"
    image_id      = "ami-d61027ad"
    instance_type = "t2.medium"
    iam_instance_profile = "ecsInstanceRole" // TODO: Create this in tf
    user_data = "${template_file.user_data.rendered}"
    security_groups = ["${var.security-group-id}"]
    associate_public_ip_address = "true"
    key_name = "kevin-test-pair"
}

resource "template_file" "user_data" {
    template = "${file("${path.module}/user-data.tpl")}"

    vars {
        ecs-cluster-name = "${var.cluster-name}"
    }
}
