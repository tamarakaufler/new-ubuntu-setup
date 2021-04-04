### 3 (INTERACTIVE)

#=========================================================================
# CLOUD
# -----

# DOCKER
# ------
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose

sudo usermod -aG docker $USER
su -s $USER
if [ $? != 0 ]; then
    echo "Root password is not set. Docker access will be granted on next your next login"
fi

# KUBECTL + HELM
# --------------
#sudo snap install kubectl --classic
#sudo snap install helm --classic

brew update
brew install kubectl
brew install helm

mkdir -p ~/.helm/plugins
helm plugin install https://github.com/databus23/helm-diff

# KUBECTX + KUBENS
# ----------------
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kctx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kns
