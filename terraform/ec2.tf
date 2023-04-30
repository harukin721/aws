resource "aws_instance" "ec2" {
  count = 0
  # Amazon Linux 2023 AMI 2023.0.20230419.0 x86_64 HVM kernel-6.1
  ami           = "ami-01b32aa8589df6208"
  instance_type = "t2.micro"
  root_block_device {
    volume_type = "gp3"
    volume_size = 30
  }
}
