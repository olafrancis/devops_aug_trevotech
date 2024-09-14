resource "aws_instance" "jenkins_master" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [aws_security_group.jenkins_sg.name]

  tags = {
    Name = "Jenkins-Master"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y openjdk-17-jre
              wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
              sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
              sudo apt update
              sudo apt install -y jenkins
              sudo systemctl enable jenkins
              sudo systemctl start jenkins
              EOF
}

resource "aws_instance" "jenkins_slave" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [aws_security_group.jenkins_sg.name]

  tags = {
    Name = "Jenkins-Slave"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y openjdk-17-jre
              mkdir /home/ubuntu/jenkins
              chmod 777 /home/ubuntu/jenkins
              EOF
}
