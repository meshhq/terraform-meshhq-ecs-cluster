module "vpc" {
    source = "./vpc"
}

module "ec2" {
    source = "./ec2"

    cluster-name = "kevin-ecs-cluster"
    security-group-id = "sg-e3882790"
    subnet-id-1 = "subnet-cf5c7595"
    subnet-id-2 = "subnet-9825d0d3"
}

module "ecs" {
    source = "./ecs"

    cluster-name = "kevin-ecs-cluster"
}
