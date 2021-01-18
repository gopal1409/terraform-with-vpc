resource "aws_instance" "example" {
    ami = var.AMIS[var.AWS_REGION]
    instance_type = "t2.micro"

    # the vpc subnet
    subnet_id = aws_subnet.app-public-1.id 
    vpc_security_group_ids = [aws_security_group.allow-ssh.id]

    #the public ssh key_name
    key_name = aws_key_pair.mykeypair.key_name
        tags = {
        Name = "storage instance gopal"
    }

}
resource "aws_ebs_volume" "ebs-volume-1" {
    #we need to check my instance and storage should be in the same data center
    availability_zone = "us-east-2a"
    size = 20
    type = "gp2"
    tags = {
        Name = "volume for gopal"
    }
}

resource "aws_volume_attachment" "ebsvolume" {
    device_name = var.INSTANCE_DEVICE_NAME
    volume_id = aws_ebs_volume.ebs-volume-1.id 
    instance_id = aws_instance.example.id
}