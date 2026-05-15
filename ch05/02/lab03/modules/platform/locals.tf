locals {
  namespace = var.namespace

  vpc_id = var.vpc_id

  iamrole = {
    name = "instance"
    assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
    policy_arn         = data.aws_iam_policy.aws_ssm_core.arn
  }

  lb = {
    name = "main"
    internal = false
    load_balancer_type = "application"
    subnets = var.lb_subnets

    listener = {
      port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

}