#!/bin/bash

VERSION=1.12.5

install_go_linux(){
   wget https://dl.google.com/go/go$VERSION.linux-amd64.tar.gz
   sudo tar -C /usr/local -xzf go$VERSION.linux-amd64.tar.gz
}

install_go_mac(){
   wget https://dl.google.com/go/go$VERSION.darwin-amd64.tar.gz
   sudo tar -C /usr/local -xzf go$VERSION.darwin-amd64.tar.gz
}

install_godep(){
    sudo curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
}
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     install_go_linux;;
    Darwin*)    install_go_mac;;
    *)          machine="UNKNOWN:${unameOut}"
esac

export PATH=$PATH:/usr/local/go/bin
mkdir -p ~/go/bin
export GOPATH=~/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
install_godep
echo 'PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'GOPATH=~/go/' >> ~/.bashrc
echo 'GOROOT=/usr/local/go' >> ~/.bashrc
#exec $SHELL
