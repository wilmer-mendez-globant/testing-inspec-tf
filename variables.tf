# Two-Tier example from https://github.com/terraform-providers/terraform-provider-aws

variable "public_key_path" {
  description = "Path to the SSH public key to be used for authentication."
  default = "~/.ssh/id_rsa.pub"
}

variable "key_name" {
  description = "Desired name of AWS key pair"
  default = "terraform"
}

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

