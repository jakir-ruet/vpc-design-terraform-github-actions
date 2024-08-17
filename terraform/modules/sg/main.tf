resource "aws_security_group" "sg_test" {
  name        = "sg_test"
  description = "Allow HTTP, SSH inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "Incoming rules HTTP"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Incoming rules SSH"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "for outgoing"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tg_sg_test"
  }
}
