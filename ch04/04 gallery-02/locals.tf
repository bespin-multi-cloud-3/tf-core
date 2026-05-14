locals {
  org     = "tf-core"
  project = "gallery"

  namespace = "${local.org}-${local.project}"

  vpc_id = data.aws_vpc.default.id

  instance = {
    name = "web"

    ami                         = data.aws_ami.amazon_linux.id
    instance_type               = "t3.small"
    associate_public_ip_address = true
    subnet_id                   = data.aws_subnets.default.ids[0]

    user_data_base64 = base64encode(templatefile("templates/user_data.sh.tpl", {
      profile     = "dev"
      server_port = 8080
    }))

    allow_access = {
      port        = 8080
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  iamrole = {
    name = "instance"

    assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
    policy_arn         = data.aws_iam_policy.aws_ssm_core.arn
  }
}
