
GOLANGCI_VERSION=v1.36.0
GOLANGCI=$(which golangci-lint 2>/dev/null)
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin ${GOLANGCI_VERSION}
