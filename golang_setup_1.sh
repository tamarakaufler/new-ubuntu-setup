### 1 - INTERACTIVE

GO_VERSION=${GO_VERSION:-1.16.3}
PROTOC_VERSION_URL=${PROTOC_VERSION:-v3.15.7}
PROTOC_VERSION=${PROTOC_VERSION:-3.15.7}
GOLANGCI_VERSION=v1.39.0

curdir=$(pwd)
repoowner=${REPO_OWNER:-tamarakaufler}

# Additinal installations
# -----------------------
sudo apt-get update
sudo apt-get -y upgrade
#sudo apt install -y build-essential gcc ca-certificates mlocate net-tools curl wget software-properties-common git file libffi-dev openvpn openvpn-systemd-resolved network-manager-openvpn tmux exuberant-ctags vim vim-editorconfig vim-scripts vim-ultisnips vim-gtk3 gnome-tweak-tool tree alembic mercurial sqlite  apt-transport-https gnupg2 gnupg-agent software-properties-common chromium-browser colordiff postgresql-client pgadmin3 wireguard
sudo apt install -y build-essential gcc ca-certificates mlocate net-tools curl wget software-properties-common git file libffi-dev tmux exuberant-ctags vim vim-editorconfig vim-scripts vim-ultisnips vim-gtk3 gnome-tweak-tool tree alembic mercurial sqlite  apt-transport-https gnupg2 gnupg-agent software-properties-common chromium-browser colordiff postgresql-client pgadmin3

# !!!! Networking - choose whatever is needed
#sudo apt install -y openvpn openvpn-systemd-resolved network-manager-openvpn
#sudo apt install -y wireguard

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

# https://stackoverflow.com/questions/60578892/protoc-gen-go-grpc-program-not-found-or-is-not-executable
go get -u google.golang.org/protobuf/cmd/protoc-gen-go
go get -u google.golang.org/grpc/cmd/protoc-gen-go-grpc

# protobuf generation
go get github.com/uber/prototool/cmd/prototool@dev

## gRPC testing
brew install grpcurl

go get github.com/fullstorydev/grpcui/...
go install github.com/fullstorydev/grpcui/cmd/grpcui@latest

# mocking
go get github.com/maxbrunsfeld/counterfeiter/v6

# golangci-lint
# recommended not to use go get ....
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin ${GOLANGCI_VERSION}


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

# linting for github README
brew install markdownlint-cli

echo "alias diff=colordiff" >> ~/.bash_aliases
echo "alias dir='dir --color=auto'" >> ~/.bash_aliases
echo "alias vdir='vdir --color=auto'" >> ~/.bash_aliases
echo "" >> ~/.bash_aliases

echo "alias gits='git status '" >> ~/.bash_aliases
echo "alias gitd='git diff '" >> ~/.bash_aliases
echo "" >> ~/.bash_aliases

bash vim_setup.sh

# buf CLI enables you to create consistent Protobuf APIs:
# A new developed high-performance Protobuf compiler.
# A linter that enforces good API design choices and structure.
# A breaking change detector that enforces compatibility at the source code or wire level.
# A generator that invokes your protoc plugins based on a configurable template.
brew install bufbuild/buf/buf
