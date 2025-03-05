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