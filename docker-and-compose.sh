# Install Docker
echo "---Installing Docker---"
echo "------>Setting up repository"
sudo apt-get install apt-transport-https ca-certificates gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
echo "------>Installing Docker Engine"
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Install Docker-Compose
echo "------>Installing Docker-Compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.2/docker-compose-$(uname -s)-$(uname -m)" -o ~/bin/docker-compose
sudo chmod +x ~/bin/docker-compose