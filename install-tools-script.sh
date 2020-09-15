#!/usr/bin/env bash

echo "---Brocahontaz installation script---\n"
echo "Installing the tools I need :-)\n"
echo "-------------------------------------\n"

# Update device
echo "Updating repositories and upgrading"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -

# Install curl
echo "Installing curl"
sudo apt-get install curl -y

# Install htop
echo "Installing htop"
sudo apt install htop -y

# Intall git
echo "Installing git"
sudo apt-get install git -y

# Install zsh
echo "Installing zsh"
sudo apt install zsh -y
chsh -s $(which zsh)

# Install oh-my-zsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerlevel10k
echo "Installing powerlevel10k zsh theme"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install nvm
echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# Install latest node
echo "Using nvm to install latest node version"
nvm install node

# Install vscode
echo "Installing vscode"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y

# Install Docker
echo "Installing Docker"
echo "Setting up repository"
sudo apt-get install apt-transport-https ca-certificates gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
echo "installing Docker Engine"
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo usermod -a -G docker $USER

# Install Docker-Compose
echo "Installing Docker-Compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.2/docker-compose-$(uname -s)-$(uname -m)" -o ~/bin/docker-compose
sudo chmod +x ~/bin/docker-compose

# Install Slack
echo "Installing Slack"
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.8.0-amd64.deb
sudo apt install ./slack-desktop-*.deb

# Install Discord
echo "Installing Discord"
sudo snap install discord

# Install Ansible
echo "Installing Ansible"
sudo apt install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

# Install Stern
echo "Installing Stern"
sudo curl https://github.com/wercker/stern/releases/download/1.11.0/stern_linux_amd64 -o ~/bin/stern
sudo chmod +x ~/bin/stern

# Install mosquitto
echo "Installing mosquitto"
sudo apt-add-repository ppa:mosquitto-dev/mosquitto-ppa
sudo apt-get update
sudo apt-get install mosquitto -y
sudo apt-get install mosquitto-clients -y

# Clean up device
echo "Post-install cleanup"
sudo apt-get autoclean -y
sudo apt-get autoremove -y