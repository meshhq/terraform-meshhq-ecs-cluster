variable "cluster-name" {
    default = "mesh-ecs-cluster"
}

variable "ecs-service-role-arn" {
    default = "mesh-ecs-cluster"
}

variable "ecs-service-name" {
    default = "mesh-ecs-service"
}

variable "ecs-load-balancer-name" {}
variable "ecs-target-group-arn" {}