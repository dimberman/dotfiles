
install_python_homebrew(){
    brew install pyenv
    pyenv install 3.6.0
}

install_python_linux(){
    # install pyenv + python 3.6
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
    exec "$SHELL"
    pyenv install 3.6.0
}

install_python_virtualenv(){
    # install virtualenvs
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
}

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     install_python_linux;;
    Darwin*)    install_python_homebrew;;
    *)          machine="UNKNOWN:${unameOut}"
esac
install_python_virtualenv
