variable "ecs-key-pair-name" {
    description = "The name of the keypair for the cluster"
    default = "kevin-test-pair"
}

variable "vpc-resource-prefix" {
    description = "The resource prefix for VPC resources."
    default = "mesh-vpc"
}

variable "iam-resource-prefix" {
    description = "The resource prefix for IAM resources."
    default = "mesh-ecs"
}

variable "ec2-resource-prefix" {
    description = "The resource prefix for EC2 resources."
    default = "mesh-ecs"
}

variable "ecs-resource-prefix" {
    description = "The resource prefix for ECS resources."
    default = "mesh-ecs"
}