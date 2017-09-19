resource "aws_launch_configuration" "ecs-launch-configuration" {
    name                        = "${var.launch-configuration-name}"
    image_id                    = "${var.image-id}"
    instance_type               = "${var.instance-type}"
    iam_instance_profile        = "${var.ecs-instance-role-name}" 
    security_groups             = ["${var.security-group-id}"]
    associate_public_ip_address = "true"
    key_name                    = "kevin-test-pair"
    user_data                   = "${template_file.user_data.rendered}"
}

resource "template_file" "user_data" {
    template = "${file("${path.module}/user-data.tpl")}"

    vars {
        ecs-cluster-name = "${var.cluster-name}"
    }
}
