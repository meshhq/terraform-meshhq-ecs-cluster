provider "aws" {
  region = "us-east-1"
}

module "iam" {
    source = "./iam"
}

module "vpc" {
    source = "./vpc"
}

module "ec2" {
    source = "./ec2"

    vpc-id                      = "${module.vpc.id}"
    security-group-id           = "${module.vpc.security-group-id}"
    subnet-id-1                 = "${module.vpc.subnet1-id}"
    subnet-id-2                 = "${module.vpc.subnet2-id}"
    ecs-instance-role-name      = "${module.iam.ecs-instance-role-name}"
    ecs-instance-profile-name   = "${module.iam.ecs-instance-profile-name}"
    ecs-cluster-name            = "${var.ecs-cluster-name}"
    ecs-key-pair-name           = "${var.ecs-key-pair-name}"
}

module "ecs" {
    source = "./ecs"

    ecs-cluster-name            = "${var.ecs-cluster-name}"
    ecs-load-balancer-name      = "${module.ec2.ecs-load-balancer-name}"
    ecs-target-group-arn        = "${module.ec2.ecs-target-group-arn}"
    ecs-service-role-arn        = "${module.iam.ecs-service-role-arn}"
}
