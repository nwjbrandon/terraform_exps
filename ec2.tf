resource "aws_instance" "foo" {
    ami             = "ami-02045ebddb047018b" 
    instance_type   = "t2.micro"
    subnet_id       = aws_subnet.public-subnet-1.id
    vpc_security_group_ids = [aws_security_group.ssh.id]
    key_name        = "nwjbrandon" 

    tags = {
        Name = "test"
    }
}

