provider "aws" {
  region = "us-east-1"
}

module "vpc" {
    source = "./vpc"
}

module "ec2" {
    source = "./ec2"

    cluster-name        = "kevin-ecs-cluster"
    security-group-id   = "${module.vpc.security-group-id}"
    subnet-id-1         = "${module.vpc.subnet1-id}"
    subnet-id-2         = "${module.vpc.subnet2-id}"
}

module "ecs" {
    source = "./ecs"

    cluster-name = "kevin-ecs-cluster"
}


resource "aws_elb" "user_data" {
}
