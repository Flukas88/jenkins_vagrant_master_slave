sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y --force-yes jenkins git
sudo sh -c 'echo "192.168.100.21 jenkins.local jenkins" >> /etc/hosts'
sudo sh -c 'echo "192.168.100.11 jenkinslave.local jenkinslave"  >> /etc/hosts'
sudo apt-get autoremove -y
sudo ssh -c "ssh-keygen -b 1024 -N '' -f /var/lib/jenkins/.ssh/id_rsa"
cat /var/lib/jenkins/.ssh/id_rsa| ssh "jenkins@jenkinslave.local"  "mkdir -p ~/.ssh; cat >> ~/.ssh/authorized_keys"
sudo service jenkins start
