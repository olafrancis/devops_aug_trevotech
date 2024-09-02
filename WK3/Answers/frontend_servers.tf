resource "aws_instance" "frontend" {
  count         = 2
  ami           = "ami-066784287e358dad1"
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.allow_http.id]

  tags = {
    Name = "frontend-server-${count.index + 1}"
  }
}
