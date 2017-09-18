variable "subnet-id-1" {}
variable "subnet-id-2" {}
variable "security-group-id" {}

resource "aws_elb" "mesh-load-banalcer" {
    name                = "mesh-load-banalcer"
    availability_zones  = ["us-east-1a", "us-east-2b"]
    subnets             = ["${var.subnet-id-1}", "${var.subnet-id-2}"]
    security_groups     = ["${var.security-group-id}"]

    listener {
        instance_port     = 80
        instance_protocol = "http"
        lb_port           = 80
        lb_protocol       = "http"
    }

    health_check {
        healthy_threshold   = 5
        unhealthy_threshold = 2
        timeout             = 5
        target              = "HTTP:80/"
        interval            = 30
    }
}