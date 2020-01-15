#/bin/bash
DIRNAME=$(cd "$(dirname "$0 (0h 0m)")"; pwd)
cat ~/.bashrc > ~/.bashrc-old
touch ~/.bashrc
cat $DIRNAME/rc_files/bashrc > ~/.bashrc
cat ~/.bash_profile > ~/.bash_profile-old
touch ~/.bash_profile
cat $DIRNAME/rc_files/bash_profile >~/.bash_profile
cat ~/.inputrc > ~/.inputrc-old
touch ~/.inputrc
cat $DIRNAME/rc_files/inputrc > ~/.inputrc
touch ~/accounts.json
cat $DIRNAME/rc_files/bashrc > ~/accounts.json
#exec $SHELL
