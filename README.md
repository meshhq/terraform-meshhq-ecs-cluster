# Terraform ECS Cluster

This repository contains `Terrorform` configuration files that provide for standing up an AWS Elastic Container Service Cluster, meant for deploying a docker image. 

## Use 

Configure a new VPC.

```
terraform apply -target=module.vpc
```

Configure a new ECS Cluster with a service.

```
terraform apply -target=module.ecs
```

Configure the auto scaling group and launch configuration via EC2.

```
terraform apply -target=module.ec2
```