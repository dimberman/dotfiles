#/bin/bash

cat ~/.bashrc > ~/.bashrc-old
touch ~/.bashrc
cat bashrc > ~/.bashrc
cat ~/.bash_profile > ~/.bash_profile-old
touch ~/.bash_profile
cat bash_profile >~/.bash_profile
cat ~/.inputrc > ~/.inputrc-old
touch ~/.inputrc
cat inputrc > ~/.inputrc
cat ~/.kube-ps1.sh > ~/.kube-ps1.sh-old
touch ~/.kube-ps1.sh
cat kube-ps1.sh > ~/.kube-ps1.sh
