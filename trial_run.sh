
PROTOC_VERSION_URL=${PROTOC_VERSION:-v3.15.1}
PROTOC_VERSION=${PROTOC_VERSION:-3.15.1}



PB_REL="https://github.com/protocolbuffers/protobuf/releases"
curl -LO $PB_REL/download/${PROTOC_VERSION_URL}/protoc-${PROTOC_VERSION}-linux-x86_64.zip
unzip protoc-${PROTOC_VERSION}-linux-x86_64.zip -d $HOME/.local
rm protoc-${PROTOC_VERSION}-linux-x86_64.zip

go get -u google.golang.org/protobuf/cmd/protoc-gen-go \
	google.golang.org/grpc/cmd/protoc-gen-go-grpc
