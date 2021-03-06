sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y --force-yes jenkins git sshpass
sudo sh -c 'echo "192.168.100.21 jenkins.local jenkins" >> /etc/hosts'
sudo sh -c 'echo "192.168.100.11 jenkinslave.local jenkinslave"  >> /etc/hosts'
sudo apt-get autoremove -y
sudo -u jenkins sh -c "echo -e  'y\n'| ssh-keygen -q -t rsa -N '' -f /var/lib/jenkins/.ssh/id_rsa"
sshpass -p 'jenkins' scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no /var/lib/jenkins/.ssh/id_rsa.pub "jenkins@jenkinslave.local:/var/lib/jenkins/.ssh/authorized_keys"
sudo service jenkins start
sudo locale-gen en_US.UTF-8
