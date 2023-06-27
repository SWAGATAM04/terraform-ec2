variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-2"
}

variable "cluster_name" {
   default = "my-cluster"
   type   = string

}

variable "instance_count" {
   description = "Number of instances to launch"
   default = 2
   type   = number
}

variable "instance_names" {
  default = ["devops-jump"]
}

variable "instance_type" {
  default = "t2.micro"
  type   = string

}


variable "ami_id" {
  description = "AWS AMI ID"
  default     = "ami-00dfe2c7ce89a450b"
  type       = string
}

variable "keypair" {
  description = "Key Name"
  default     = "runner"
  type        = string
}

variable "security_group" {
  description = "SG Name"
  type        = list(string)
  default     = ["sg-096115a7a2975f44d"]
}

variable "subnet_id" {
  description = "Subnet ID"
  default     = "subnet-5bf92130"
  type        = string
}


