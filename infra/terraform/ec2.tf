############################
# Security Group
############################
resource "aws_security_group" "ledger_sg" {
  name        = "ledger-sg"
  description = "Security group for regulated ledger services"

  ingress {
    description = "Payment API"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # tighten later
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["YOUR_IP/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

############################
# Payment API EC2
############################
resource "aws_instance" "payment_api" {
  ami                    = "ami-0abcdef12345"
  instance_type          = "t3.micro"
  iam_instance_profile   = aws_iam_instance_profile.profile.name
  vpc_security_group_ids = [aws_security_group.ledger_sg.id]

  user_data = file("${path.module}/user_data/payment_api.sh")

  tags = {
    Name = "payment-api"
    Role = "payment"
  }
}

############################
# Ledger Writer EC2
############################
resource "aws_instance" "ledger_writer" {
  ami                    = "ami-0abcdef12345"
  instance_type          = "t3.micro"
  iam_instance_profile   = aws_iam_instance_profile.profile.name
  vpc_security_group_ids = [aws_security_group.ledger_sg.id]

  user_data = file("${path.module}/user_data/ledger_writer.sh")

  tags = {
    Name = "ledger-writer"
    Role = "ledger"
  }
}

############################
# Audit Writer EC2
############################
resource "aws_instance" "audit_writer" {
  ami                    = "ami-0abcdef12345"
  instance_type          = "t3.micro"
  iam_instance_profile   = aws_iam_instance_profile.profile.name
  vpc_security_group_ids = [aws_security_group.ledger_sg.id]

  user_data = file("${path.module}/user_data/audit_writer.sh")

  tags = {
    Name = "audit-writer"
    Role = "audit"
  }
}
