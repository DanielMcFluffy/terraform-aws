output "aws_region" {
  value = var.region
}
output "aws_ami" {
  value = data.aws_ami.ami
}