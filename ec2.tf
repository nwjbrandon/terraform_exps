resource "aws_instance" "bastion" {
  ami                    = "ami-02045ebddb047018b"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public-subnet-1.id
  vpc_security_group_ids = [aws_security_group.ec2.id]
  key_name               = var.KEYPAIR_NAME

  tags = {
    Name = "test"
  }
}

