
data "aws_iam_policy_document" "ecs-instance-policy" {
    statement {
        actions = ["sts:AssumeRole"]

        principals {
            type        = "Service"
            identifiers = ["ecs.amazonaws.com"]
        }
    }
}

resource "aws_iam_role" "ecs-instance-role" {
    name                = "ecs-instance-role"
    path                = "/"
    assume_role_policy  = "${data.aws_iam_policy_document.ecs-instance-policy.json}"
}

resource "aws_iam_role_policy_attachment" "ecs-instance-role-attachment" {
    role       = "${aws_iam_role.ecs-instance-role.name}"
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

output "ecs-instance-role-id" {
  value = "${aws_security_group.mesh-vpc-security-group.id}"
}