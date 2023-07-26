#/bin/bash
sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
sudo curl -fL https://install-cli.jfrog.io | sh
sudo mkdir -p /home/gitlab-runner/actions-runner
sudo curl -o /home/gitlab-runner/actions-runner-linux-x64-2.305.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.305.0/actions-runner-linux-x64-2.305.0.tar.gz
sudo su - root -c "echo 'gitlab-runner   ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers"
sudo yum install -y wget unzip
sudo curl -o /tmp/terraform_1.5.3_linux_amd64.zip -L https://releases.hashicorp.com/terraform/1.5.3/terraform_1.5.3_linux_amd64.zip
sudo unzip /tmp/terraform_1.5.3_linux_amd64.zip -d /usr/local/bin/
sudo curl -o /tmp/openlogic-openjdk-11.0.18+10-linux-x64-el.rpm -L https://builds.openlogic.com/downloadJDK/openlogic-openjdk/11.0.18+10/openlogic-openjdk-11.0.18+10-linux-x64-el.rpm
sudo yum install -y /tmp/openlogic-openjdk-11.0.18+10-linux-x64-el.rpm
sudo curl -o /tmp/apache-maven-3.8.2-bin.tar.gz -L https://archive.apache.org/dist/maven/maven-3/3.8.2/binaries/apache-maven-3.8.2-bin.tar.gz
sudo tar -vxzf /tmp/apache-maven-3.8.2-bin.tar.gz -C /opt/
echo 'export MAVEN_HOME=/opt/apache-maven-3.8.2' >> .bashrc
echo 'PATH=$PATH:$MAVEN_HOME/bin' >> .bashrc
echo 'export JAVA_HOME=/usr/lib/jvm/openlogic-openjdk-11-hotspot' >> .bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> .bashrc
sudo cp .bashrc /home/gitlab-runner/.bashrc
sudo curl -o /home/gitlab-runner/jboss-eap-7.4.0.zip -L  https://kubesphere-ohio-eks.s3.us-east-2.amazonaws.com/jboss-eap-7.4.0.zip
sudo unzip /home/gitlab-runner/jboss-eap-7.4.0.zip -d /home/gitlab-runner/
sudo chown -R gitlab-runner:gitlab-runner /home/gitlab-runner/
sudo ipv4=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
sudo su - gitlab-runner -c "bash /home/gitlab-runner/jboss-eap-7.4.0/bin/standalone.sh -Djboss.bind.address=$ipv4 &"
