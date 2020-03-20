output "address" {
  value = aws_elb.web.dns_name
}

output "instance_id" {
  value = aws_instance.web.id
}

output "vpc_id" {
  value = aws_vpc.default.id
}

output "elb_security_group_id" {
  value = aws_security_group.sg_elb.id
}

output "ec2_security_group_id" {
  value = aws_security_group.default.id
}

