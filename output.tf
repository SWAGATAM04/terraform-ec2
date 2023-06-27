output "id" {
  description = "List of IDs of instances"
  value       = aws_instance.web.*.id
}


output "availability_zone" {
  description = "List of availability zones of instances"
  value       = aws_instance.web.*.availability_zone
}




output "public_dns" {
  description = "List of public DNS names assigned to the instances. For EC2-VPC, web is only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.web.*.public_dns
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.web.*.public_ip
}


output "primary_network_interface_id" {
  description = "List of IDs of the primary network interface of instances"
  value       = aws_instance.web.*.primary_network_interface_id
}

output "private_dns" {
  description = "List of private DNS names assigned to the instances. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.web.*.private_dns
}

output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = aws_instance.web.*.private_ip
}


