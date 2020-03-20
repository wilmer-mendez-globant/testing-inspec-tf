# Two-Tier example from https://github.com/terraform-providers/terraform-provider-aws

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-2"
}

# Ubuntu Server 18.04 LTS (x64)
variable "aws_amis" {
  default = {
    us-east-2 = "ami-0fc20dd1da406780b"
  }
}

