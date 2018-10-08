provider "aws" {
  alias  = "canada-1"
  region = "ca-central-1"
}

resource "aws_instance" "simpsons_box" {
    ami =  "${var.ami}"
    instance_type = "m4.xlarge"
    provider = "aws.canada-1"
    vpc_security_group_ids = ["sg-0dd10f4268adccd87","sg-035dc4cc634f32a01","sg-59c66430"]
    key_name = "key_CAN"

    tags {
        Name = "simpsons_box_ca"
    }

    # add a wait for this to be able to RDP
    # New-Object System.Net.Sockets.TCPClient -ArgumentList "ec2-54-175-237-77.compute-1.amazonaws.com",3389
    # provisioner "local-exec" {
    #     command = "aws ec2 wait password-data-available --instance-id ${aws_instance.simpsons_box.id} --region ca-central-1"
    # }
}
