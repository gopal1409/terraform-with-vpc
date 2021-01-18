resource "aws_instance" "example" {
    ami = var.AMIS[var.AWS_REGION]
    instance_type = "t2.micro"

    # the vpc subnet
    subnet_id = aws_subnet.app-public-1.id 
    vpc_security_group_ids = [aws_security_group.allow-ssh.id]

    #the public ssh key_name
    key_name = aws_key_pair.mykeypair.key_name
}
