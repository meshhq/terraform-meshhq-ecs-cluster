resource "aws_autoscaling_group" "ecs-autoscaling-group" {
    name                        = "${var.autoscaling-group-name}"
    max_size                    = "${var.max-instance-size}"
    min_size                    = "${var.min-instance-size}"
    desired_capacity            = "${var.desired-capacity}"
    vpc_zone_identifier         = ["${var.subnet-id-1}", "${var.subnet-id-2}"]
    launch_configuration        = "${aws_launch_configuration.ecs-launch-configuration.name}"
    health_check_type           = "ELB"
}