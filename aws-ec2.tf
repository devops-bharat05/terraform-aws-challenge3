resource "aws_instance" "citadel" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.citadel-key.key_name
  security_groups = [aws_security_group.citadel_sg.name]

  user_data = file("${path.module}/install-nginx.sh")

  tags = {
    Name = "citadel"
  }
}
