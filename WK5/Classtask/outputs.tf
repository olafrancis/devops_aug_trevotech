output "master_public_ip" {
  description = "Public IP of the Jenkins Master node"
  value       = aws_instance.jenkins_master.public_ip
}

output "slave_public_ip" {
  description = "Public IP of the Jenkins Slave node"
  value       = aws_instance.jenkins_slave.public_ip
}
