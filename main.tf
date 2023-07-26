resource "aws_instance" "web" {
  count         = var.instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.keypair
  monitoring             = true
  vpc_security_group_ids = flatten([var.security_group])
  subnet_id              = var.subnet_id

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/key.pem")
    host        = self.public_ip
  }
 
  provisioner "file" {
    source      = "software.sh"
    destination = "/tmp/software.sh"
  }

 provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/software.sh",
      "/bin/bash /tmp/software.sh"
    ]
  }


  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name = "${element(var.instance_names, count.index)}"
  }
}

provider "aws" {
	region = "${var.aws_region}"
}

terraform {
  backend "s3" {
    bucket         = "st-r22eksvv-bucket1"  #ACCOUNT_ID should be set manually for Workstation Deployment. Example: "terraform-state-bucket-514816568735"
    dynamodb_table = "st-r22eksvv-bucket1" #ACCOUNT_ID should be set manually for Workstation Deployment. Example: "terraform-lock-dynamodb-514816568735"
    key            = "st-ec2.tfstate"
    encrypt        = true
    region         = "us-east-1"
  }
}
