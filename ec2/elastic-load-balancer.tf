variable "vpc-id" {}

resource "aws_alb" "mesh-load-balancer" {
    name                = "mesh-load-balancer"
    security_groups     = ["${var.security-group-id}"]
    subnets             = ["${var.subnet-id-1}", "${var.subnet-id-2}"]
}

resource "aws_alb_target_group" "mesh-target_group" {
    name                = "mesh-target-group"
    port                = "80"
    protocol            = "HTTP"
    vpc_id              = "${var.vpc-id}"

    health_check {
        healthy_threshold   = "5"
        unhealthy_threshold = "2"
        interval            = "30"
        matcher             = "200"
        path                = "/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = "5"
    }
}

resource "aws_alb_listener" "mesh-alb-listener" {
    load_balancer_arn = "${aws_alb.mesh-load-balancer.arn}"
    port              = "80"
    protocol          = "HTTP"
    
    default_action {
        target_group_arn = "${aws_alb_target_group.mesh-target_group.arn}"
        type             = "forward"
    }
}