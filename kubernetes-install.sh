install_kubectl_mac(){
    brew install kubectl
}
install_kubectl_linux(){

    sudo apt-get update && sudo apt-get install -y apt-transport-https
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
    sudo apt-get update
    sudo apt-get install -y kubectl
}
#install_kubectl_linux
DIRNAME=$(cd "$(dirname "$0 (0h 0m)")"; pwd)
cat $DIRNAME/kube-ps1.sh > ~/.kube-ps1.sh
cat $DIRNAME/rc_files/kuberc > ~/.kuberc
echo 'source ~/.kuberc' >> ~/.bashrc
echo 'export PS1="\u \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] \$(ps1_kube) $ "' >> ~/.bashrc
#exec $SHELL
