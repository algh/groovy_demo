provider "aws" {
  alias  = "east1"
  region = "us-east-1"
}

resource "aws_instance" "simpsons_box" {
    ami =  "${var.ami}"
    instance_type = "m4.xlarge"
    provider = "aws.east1"
    vpc_security_group_ids = ["sg-06fe7a1ab40c83dd2","sg-096402f22de7d1b6e","sg-524f0b2a"]
    key_name = "IFS"
    get_password_data = "true"

    tags {
        Name = "simpsons_box"
    }

    # add a wait for this to be able to RDP
    # New-Object System.Net.Sockets.TCPClient -ArgumentList "ec2-54-175-237-77.compute-1.amazonaws.com",3389
    # provisioner "local-exec" {
    #     command = "aws ec2 wait password-data-available --instance-id ${aws_instance.simpsons_box.id}"
    # }
}
