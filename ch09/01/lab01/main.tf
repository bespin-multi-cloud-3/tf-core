resource "aws_security_group" "web" {
  name = "${local.namespace}-sg-web"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "name" {
  instance_type = "t3.large"
}
