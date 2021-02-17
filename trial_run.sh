# DOCKER
# ------
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker $USER
su -s $USER
if [ $? != 0 ]; then
    echo "Root password is not set. Docker access will be granted on next your next login"
fi
