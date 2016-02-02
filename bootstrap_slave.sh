sudo sh -c 'echo "192.168.100.21 jenkins.local jenkins" >> /etc/hosts'
sudo sh -c 'echo "192.168.100.11 jenkinslave.local jenkinslave"  >> /etc/hosts'
sudo groupadd jenkins
sudo useradd -m -d /var/lib/jenkins -g jenkins jenkins
sudo sh -c 'echo "jenkins:jenkins" | chpasswd'
sudo mkdir -p /var/lib/jenkins/.ssh
sudo chown -R jenkins:jenkins /var/lib/jenkins/.ssh
sudo
sudo apt-get install -y --force-yes openjdk-7-jre-headless git
sudo apt-get autoremove -y
