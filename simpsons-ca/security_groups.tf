# resource "aws_security_group" "apt-1" {
#   name        = "apartment vpc"
#   description = "Allow all inbound traffic"
#   vpc_id      = "${aws_vpc.main.id}"

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["174.114.240.167/32"]
#   }

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["174.114.240.167/32"]
#   }

#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["174.114.240.167/32"]
#   }

#   ingress {
#     from_port   = 0
#     to_port     = 65535
#     protocol    = "-1"
#     security_groups = ["${aws_security_group.apt-1.id}"]
#   }

#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }
# }