export PATH=$PATH:~/bin/:/Users/dimberman/.local/bin
set -o vi
alias vi=vim
alias pipeline="cd ~/code/ml-pipeline"
alias molair="cd ~/code/ds/molecula-infra-airflow"
export GOROOT=/usr/local/go
export GOPATH=/Users/dimberman/go/
alias airdev="cd ~/code/open-source/airflow"
alias kdev="cd ~/code/ds/ds-platform-ctrl"
alias sdk="cd /Users/dimberman/code/ds/front-end/ds-platform-python-sdk"
alias api="cd /Users/dimberman/code/ds/front-end/ds-api-official"
alias frame="cd /Users/dimberman/code/ds/frameworks/"
alias plat="cd /Users/dimberman/go/src/bbgithub.dev.bloomberg.com/ds/platform"
alias platprox="cd /Users/dimberman/go/src/bbgithub.dev.bloomberg.com/ds/platformproxy"
alias katiedev="cd /Users/dimberman/code/ds/front-end/ds-platform-ctrl"
export MOL_CODE=~/code/ds/molecula-infra-airflow
export AIRFLOW_CODE=~/code/open-source/airflow
export AIRDS=~/code/ds/molecula-airflow-ds
export BBGITHUB_TOKEN="97560dd77dcb1fd11290e2def97da794ac12c7d8@"
export GIT_REPO="dimberman/test_dags"
alias vkube="export KUBECONFIG=~/.kube/kubectl-vagrant.conf"
export GIT_REVISION="HEAD"
export WIKI_URL="https://cms.prod.bloomberg.com/team/"
kenv(){
	eval $(minikube docker-env)
}
bprox(){
	echo "setting proxy"
export http_proxy=http://proxy.bloomberg.com:81
export https_proxy=https://proxy.bloomberg.com:81
export HTTP_PROXY=http://proxy.bloomberg.com:81
export HTTPS_PROXY=https://proxy.bloomberg.com:81
export no_proxy=bbgithub.dev.bloomberg.com,localhost
}
dconfig(){
	eval $(rm ~/.kube/config)
	eval $(ln -s ~/.kube/config.dev ~/.kube/config)
}
vconfig(){
	eval $(rm ~/.kube/config)
	eval $(ln -s ~/.kube/config.vagrant ~/.kube/config)
}
mkconfig(){
	eval $(rm ~/.kube/config)
	eval $(ln -s ~/.kube/config.minikube ~/.kube/config)
}
unbprox(){
	echo "unsetting proxy"
unset http_proxy
unset https_proxy
unset HTTP_PROXY
unset HTTPS_PROXY
unset no_proxy

}
test -f ~/.git-completion.bash && . $_
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
source ~/.bashrc
# added by Anaconda3 5.0.1 installer
# export PATH="/usr/local/Cellar/pipenv/2018.5.18/bin:/Users/dimberman/anaconda3/bin:$GOROOT:$PATH"
export PS1="\u \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] \$(ps1_kube) $ "
