provider "aws" {
  region = "us-east-1"
}

module "iam" {
    source = "./iam"

    resource-prefix             = "${var.iam-resource-prefix}"
}

module "vpc" {
    source = "./vpc"

    resource-prefix             = "${var.vpc-resource-prefix}"
}

module "ec2" {
    source = "./ec2"

    resource-prefix             = "${var.ec2-resource-prefix}"
    vpc-id                      = "${module.vpc.id}"
    security-group-id           = "${module.vpc.security-group-id}"
    subnet-id-1                 = "${module.vpc.subnet1-id}"
    subnet-id-2                 = "${module.vpc.subnet2-id}"
    ecs-instance-role-name      = "${module.iam.ecs-instance-role-name}"
    ecs-instance-profile-name   = "${module.iam.ecs-instance-profile-name}"
    ecs-cluster-name            = "${module.ecs.cluster-name}"
    ecs-key-pair-name           = "${var.ecs-key-pair-name}"
}

module "ecs" {
    source = "./ecs"

    resource-prefix             = "${var.ecs-resource-prefix}"
    ecs-target-group-arn        = "${module.ec2.ecs-target-group-arn}"
    ecs-service-role-arn        = "${module.iam.ecs-service-role-arn}"
}
