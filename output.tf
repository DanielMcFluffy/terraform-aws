output "aws_region" {
  value = var.region
}
output "aws_ami" {
  value = module.server-1.aws_ami
}
output "public_dns" {
  value = module.server-1.public_dns
}
output "public_ip" {
  value = module.server-1.public_ip
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}