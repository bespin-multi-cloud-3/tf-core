output "instance" {
  value = {
    (local.instance.name) = {
      id = aws_instance.this.id
      public_ip = aws_instance.this.public_ip
    }
  }
}

output "web_endpoit" {
  value = "http://${aws_instance.this.public_ip}:${local.instance.allow_access.port}"
}
