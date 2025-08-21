resource "aws_eip" "eip" {
  vpc = true
  instance = aws_instance.citadel.id
  # Local-exec provisioner to save the public_dns to a file
  provisioner "local-exec" {
    command = "echo ${self.public_dns} > /root/citadel_public_dns.txt"
        }
}

