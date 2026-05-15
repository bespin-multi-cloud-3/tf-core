resource "aws_lb" "this" {
  name               = "${local.namespace}-lb-${local.lb.name}"

  load_balancer_type = local.lb.load_balancer_type
  internal           = local.lb.internal
  subnets            = local.lb.subnets
  security_groups    = [aws_security_group.this.id]
}

resource "aws_lb_listener" "this" {
  port     = local.lb.listener.port
  protocol = local.lb.listener.protocol

  load_balancer_arn = aws_lb.this.arn

  default_action {
    type             = "forward"
    # target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_security_group" "this" {
  name = "${local.namespace}-sg-lb-${local.lb.name}"

  vpc_id = local.vpc_id

  ingress {
    to_port     = local.lb.listener.port
    from_port   = local.lb.listener.port
    cidr_blocks = local.lb.listener.cidr_blocks
    protocol    = local.lb.listener.protocol
  }

  egress {
    to_port     = 0
    from_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
  }

  tags = {
    Name = "${local.namespace}-sg-lb-${local.lb.name}"
  }     
}
