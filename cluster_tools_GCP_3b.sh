CLOUDSDK_VERSION=327.0.0

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