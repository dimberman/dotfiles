PYTHON_VERSION=3.6.0

install_python_homebrew(){
    brew install pyenv
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    pyenv install $PYTHON_VERSION
}

install_python_linux(){
    # install pyenv + python 3.6
    sudo apt-get install git python-pip make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev -y
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    pyenv install $PYTHON_VERSION
    pyenv global $PYTHON_VERSION
}

install_python_virtualenv(){
    # install virtualenvs
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
}

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     install_python_linux;;
    Darwin*)    install_python_homebrew;;
    *)          machine="UNKNOWN:${unameOut}"
esac
install_python_virtualenv
#exec $SHELL
