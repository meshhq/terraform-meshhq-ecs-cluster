//----------------------------------------------------------------------
// Shared Variables
//----------------------------------------------------------------------

variable "resource-prefix" {}
variable "vpc-id" {}
variable "subnet-id-1" {}
variable "subnet-id-2" {}
variable "security-group-id" {}
variable "ecs-instance-role-name" {}
variable "ecs-instance-profile-name" {}
variable "ecs-cluster-name" {}
variable "ecs-key-pair-name" {}

//----------------------------------------------------------------------
// Autoscaling Group Variables
//----------------------------------------------------------------------

variable "max-instance-size" {
    description = "The max number of instances to deploy."
    default     = 5
}

variable "min-instance-size" {
    description = "The min number of instances to deploy."
    default     = 2
}

variable "desired-capacity" {
    description = "The desired number of instances to deploy."
    default     = 3
}

variable "health-check-grace-period" {
    description = "The health check grace period for the load balancer."
    default     = 300
}

//----------------------------------------------------------------------
// Launch Configuration Variables
//----------------------------------------------------------------------

variable "image-id" {
    description = "The image id for the launch configuration."
    default = "ami-d61027ad"
}

variable "instance-type" {
    description = "The instance type for the launch configuration."
    default = "t2.medium"
}