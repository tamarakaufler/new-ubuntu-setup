GO_VERSION=${GO_VERSION:-1.16}

wget https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz && sudo tar -C /usr/local -xvf go${GO_VERSION}.linux-amd64.tar.gz
rm -rf go${GO_VERSION}.linux-amd64.tar.gz*
