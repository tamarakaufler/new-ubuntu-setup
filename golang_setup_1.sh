### 1 - INTERACTIVE

GO_VERSION=${GO_VERSION:-1.15.8}
PROTOC_VERSION_URL=${PROTOC_VERSION:-v3.14.0}
PROTOC_VERSION=${PROTOC_VERSION:-3.14.0}
curdir=$(pwd)
repoowner=${REPO_OWNER:-tamarakaufler}

# Additinal installations
# -----------------------
sudo apt-get update
sudo apt-get -y upgrade
sudo apt install -y build-essential gcc ca-certificates mlocate curl wget software-properties-common git file libffi-dev openvpn openvpn-systemd-resolved network-manager-openvpn tmux exuberant-ctags vim vim-editorconfig vim-scripts vim-ultisnips vim-gtk3 gnome-tweak-tool tree alembic mercurial sqlite  apt-transport-https gnupg2 gnupg-agent software-properties-common chromium-browser colordiff

# Golang
# -----------------------
wget https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz && sudo tar -C /usr/local -xvf go${GO_VERSION}.linux-amd64.tar.gz
rm -rf go${GO_VERSION}.linux-amd64.tar.gz*
mkdir -p ~/go/{src,bin,pkg}
echo "export GOROOT=/usr/local/go" >> ~/.profile
echo "export GOPATH=$HOME/go" >> ~/.profile
echo "export PATH=\$GOROOT/bin:\$GOPATH/bin:\$PATH" >> ~/.profile
echo "" >> ~/.profile
source ~/.profile

# useful Go packages
# ------------------

# gRPC
# ----
#sudo apt update
#sudo apt install -y libprotobuf-dev protobuf-compiler

PB_REL="https://github.com/protocolbuffers/protobuf/releases"
curl -LO $PB_REL/download/${PROTOC_VERSION_URL}/protoc-${PROTOC_VERSION}-linux-x86_64.zip
unzip protoc-${PROTOC_VERSION}-linux-x86_64.zip -d $HOME/.local
rm protoc-${PROTOC_VERSION}-linux-x86_64.zip

echo "export PATH=\$HOME/.local/bin:\$PATH" >> ~/.profile
echo "" >> ~/.profile

go get google.golang.org/protobuf/cmd/protoc-gen-go \
       google.golang.org/grpc/cmd/protoc-gen-go-grpc

# Visual Studio
# -------------
#sudo apt update
#https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
#sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
#sudo apt -y install code

sudo snap install --classic code

# nodejs
#curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

#==========================
# create useful directories
#==========================
mkdir -p ~/go_projects/${repoowner}
if [ $? == 0 ]; then
    echo "alias goproj='cd ~/go_projects'" >> ~/.bash_aliases
    echo "alias goprojt='cd ~/go_projects/$repoowner'" >> ~/.bash_aliases
fi



#===========
# utilities
#===========

# https://github.com/BurntSushi/ripgrep"
brew install ripgrep

echo "alias diff=colordiff" >> ~/.bash_aliases
echo "alias dir='dir --color=auto'" >> ~/.bash_aliases
echo "alias vdir='vdir --color=auto'" >> ~/.bash_aliases
echo "" >> ~/.bash_aliases

echo "alias gits='git status '" >> ~/.bash_aliases
echo "alias gitd='git diff '" >> ~/.bash_aliases
echo "" >> ~/.bash_aliases

bash vim_setup.sh
