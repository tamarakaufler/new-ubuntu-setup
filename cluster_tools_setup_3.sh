### 3 (INTERACTIVE)

CLOUDSDK_VERSION=327.0.0

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
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker $USER
su -s $USER
if [ $? != 0 ]; then
    echo "Root password is not set. Docker access will be granted on next your next login"
fi

# GOOGLE CLOUD SDK
# ----------------
mkdir -p ~/tools/google-cloud-sdk
wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUDSDK_VERSION}-linux-x86_64.tar.gz
tar -C ~/tools/google-cloud-sdk zxf google-cloud-sdk-${CLOUDSDK_VERSION}-linux-x86_64.tar.gz
echo "export PATH=$HOME/tools/google-cloud-sdk/bin:\$PATH" >>~/.profile
rm google-cloud-sdk-${CLOUDSDK_VERSION}-linux-x86_64.tar*
echo "export GOOGLE_APPLICATION_CREDENTIALS=~/.config/gcloud/application_default_credentials.json" >> ~/.profile
#echo "export CLOUDSDK_PYTHON=$(which python3)" >> ~/.profile
echo "" >> ~/.profile

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



# INTERACTIVE - this needs a cleanup

# # GOOGLE CLOUD SDK - authentication
# ------------------

## TO INSTALL USING OS PACKAGE MANAGER
# # Create environment variable for correct distribution
# echo "export CLOUD_SDK_REPO=\"cloud-sdk-$(lsb_release -c -s)\""  >> ~/.profile
# 
# # Add the Cloud SDK distribution URI as a package source
# echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
# 
# # Import the Google Cloud Platform public key
# curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# 
# # Update the package list and install the Cloud SDK
# sudo apt update && sudo apt install -y google-cloud-sdk

## => gcloud init => this launches a browser to login


# GOOGLE CLOUD

# AUTHENTICATE WITH GOOGLE CLOUD
# ------------------------------

# gcloud auth application-default login
# gcloud config set compute/zone europe-west1-d

#  gcloud auth application-default login =>
# -------------------------------------------------------------------
# Your browser has been opened to visit:
# 
#     https://accounts.google.com/o/oauth2/auth?redirect_uri=http%3A%2F%2Flocalhost%3A8085%2F&prompt=select_account&response_type=code&client_id=764086051850-6qr4p6gpi6hn506pt8ejuq83di341hur.apps.googleusercontent.com&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcloud-platform&access_type=offline
# 
# 
# Created new window in existing browser session.
# 
# Credentials saved to file: [/home/tamara/.config/gcloud/application_default_credentials.json]
# 
# These credentials will be used by any library that requests
# Application Default Credentials.
# 
# To generate an access token for other uses, run:
#   gcloud auth application-default print-access-token
# -------------------------------------------------------------------

