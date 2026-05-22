variable "service_port" {
  type    = number
  default = 8080

  validation {
    condition     = 1 <= var.service_port && var.service_port <= 65535
    error_message = "service_port는 1~65535 범위여야 합니다."
  }
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]

  validation {
    condition     = length(var.cidr_blocks) > 0
    error_message = "cidr_blocks 최소 1개 이상 CIDR를 포함해야 합니다."
  }
}

variable "instance_type" {
  type    = string
  default = "t3.small"

  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "instance_type은 t3.micro, t3.small, t3.medium 중 하나여야 합니다."
  }
}
