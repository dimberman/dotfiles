# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]\$($ps1_kube) $ "
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export PATH=$PATH:$HOME/bin
SBT_OPTS="-Dsbt.override.build.repos=true \
          -Dfile.encoding=UTF8 \
          -Dhttp.proxyHost=bproxy.tdmz1.bloomberg.com \
          -Dhttp.proxyPort=80 \
          -Dhttp.nonProxyHosts=localhost|127.* \
          -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
export PS1="\W \$"
