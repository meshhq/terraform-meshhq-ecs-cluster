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

    cluster-name            = "${var.ecs-cluster-name}"
    vpc-id                  = "${module.vpc.id}"
    security-group-id       = "${module.vpc.security-group-id}"
    subnet-id-1             = "${module.vpc.subnet1-id}"
    subnet-id-2             = "${module.vpc.subnet2-id}"
    ecs-instance-role-name  = "${module.iam.ecs-instance-role-name}"
}

module "ecs" {
    source = "./ecs"

    cluster-name           = "${var.ecs-cluster-name}"
    ecs-service-role-arn   = "${module.iam.ecs-service-role-arn}"
}
