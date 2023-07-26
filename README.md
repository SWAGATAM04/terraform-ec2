# terraform-ec2


1. Provison 1 EC2 instance manually from aws .
2. create a github-runner user 

3. register the box as runner within github
4. yum install git  libicu -y

5. copy the server login .pem file under /home/github-runner/.ssh/key.pem
6. chmod 400 /home/github-runner/.ssh/key.pem
7. /etc/sudoers github-runner [gitlab-runner   ALL=(ALL)       NOPASSWD: ALL]

