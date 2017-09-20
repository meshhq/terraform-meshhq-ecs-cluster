resource "aws_launch_configuration" "ecs-launch-configuration" {
    name                        = "${var.launch-configuration-name}"
    image_id                    = "${var.image-id}"
    instance_type               = "${var.instance-type}"
    iam_instance_profile        = "${var.ecs-instance-profile-name}" 
    security_groups             = ["${var.security-group-id}"]
    associate_public_ip_address = "true"
    key_name                    = "${var.ecs-key-pair-name}"
    user_data                   = "${template_file.ecs-launch-configuration-user-data.rendered}"
}

resource "template_file" "ecs-launch-configuration-user-data" {
    template = "${file("${path.module}/user-data.tpl")}"

    vars {
        ecs-cluster-name = "${var.ecs-cluster-name}"
    }
}
