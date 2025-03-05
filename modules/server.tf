data "aws_ami" "this" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/*"]
  }
}

# resource "aws_key_pair" "deployer" {
#   key_name = "deployer-key"
#   public_key = var.public_key
# }

resource "aws_instance" "this" {
  ami           = data.aws_ami.this.id
  instance_type = "t3.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    "Name" = "HiWorld"
  }

  depends_on = [ var.internet_gateway ]
}

# variable "public_key" {
#   description = "ssh public key"
#   type        = string
#   default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDTK7xQFVCdU2V3WBS3H7FL4BD1wEC4uTktRS0qDUx6yiME0TpYtnWlfDIiPB17Q0rOCNIdsXKch7w4rYYRkMcXML+koY0fVMeJDM/moJ5ZuWm+iBPREXVpokSFhvd33+JTp+hTBUOfe6r2TsPlfpScOoCQBZBmiUeyomx9im10WN459tnJfLxu/3SqolWGa+q3fsnZkMeQ0BetnaNjtArtlbRmXILxmjP06pnI3UmniIFsOLJPoxxP0Npw4SZi7KgeYhdBZTThYEMRM8CWsqRCL73hwGljDHroGxyIa9l9zoNZe/Lvsit0GYOdshm/rCOgDgg6T4L2Q0wIEuDY2JTDMNI/snfXlsVNye3zC2Dwz4zRREgfw+qE2mFLW3VVWY3ymamC8aJBqw9tzTJJi+ODtZuJMGGwb6pQoVPD7iPngsjLvr6FtDERVw9ngxYS8ERbPk1M2E2R977yvsbJMLbpBZmkir3vyS9hUD/SRcXqK2zljDaDE/ExmdqaOCTILRc="
# }
variable "subnet_id" {
  description = "ID of the subnet to launch the instance into"
  type        = string
}

variable "security_group_id" {
  description = "ID of the security group to assign to the instance"
  type        = string
}

variable "internet_gateway" {
    description = "Internet gateway"
    type = string
}

output "aws_ami" {
  value = data.aws_ami.this
}

output "public_ip" {
  value = aws_instance.this.public_ip
}

output "public_dns" {
  value = aws_instance.this.public_dns
}