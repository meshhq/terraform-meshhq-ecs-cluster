variable "subnet-id-1" {}
variable "subnet-id-2" {}

resource "aws_autoscaling_group" "mesh-ecs-asg" {
    name                        = "mesh-ecs-asg"
    max_size                    = 3
    min_size                    = 1
    health_check_grace_period   = 300
    health_check_type           = "ELB"
    desired_capacity            = 2
    force_delete                = true
    launch_configuration        = "${aws_launch_configuration.mesh-ecs-launch-config.name}"
    vpc_zone_identifier         = ["${var.subnet-id-1}", "${var.subnet-id-2}"]
}