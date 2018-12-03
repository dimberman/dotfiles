source ~/.kube-ps1.sh

ps1_kube ()
{
    [[ "${KUBE_PS1_ENABLED}" == "off" ]] && return;
    local KUBE_PS1;
    local KUBE_PS1_RESET_COLOR="${_KUBE_PS1_OPEN_ESC}${_KUBE_PS1_DEFAULT_FG}${_KUBE_PS1_CLOSE_ESC}";
    [[ -n "${KUBE_PS1_BG_COLOR}" ]] && KUBE_PS1+="$(_kube_ps1_color_bg ${KUBE_PS1_BG_COLOR})";
    [[ -n "${KUBE_PS1_PREFIX}" ]] && KUBE_PS1+="${KUBE_PS1_PREFIX}";
    KUBE_PS1+="$(_kube_ps1_color_fg $KUBE_PS1_SYMBOL_COLOR)$(_kube_ps1_symbol)${KUBE_PS1_RESET_COLOR}";
    if [[ -n "${KUBE_PS1_SEPARATOR}" ]] && [[ "${KUBE_PS1_SYMBOL_ENABLE}" == true ]]; then
        KUBE_PS1+="${KUBE_PS1_SEPARATOR}";
    fi;
    KUBE_PS1+="$(_kube_ps1_color_fg                                        $KUBE_PS1_CTX_COLOR)${KUBE_PS1_CONTEXT}${KUBE_PS1_RESET_COLOR}"
    if [[ -n "${KUBE_PS1_SEPARATOR}" ]] && [[ "${KUBE_PS1_SYMBOL_ENABLE}" == true ]]; then
    if [[ "${KUBE_PS1_NS_ENABLE}" == true ]]; then
        KUBE_PS1+="${KUBE_PS1_SEPARATOR}";
    fi;
        KUBE_PS1+="$(_kube_ps1_color_fg ${KUBE_PS1_NS_COLOR})${KUBE_PS1_NAMESPACE}${KUBE_PS1_RESET_COLOR}";
    fi;
    [[ -n "${KUBE_PS1_SUFFIX}" ]] && KUBE_PS1+="${KUBE_PS1_SUFFIX}";
    [[ -n "${KUBE_PS1_BG_COLOR}" ]] && KUBE_PS1+="${_KUBE_PS1_OPEN_ESC}${_KUBE_PS1_DEFAULT_BG}${_KUBE_PS1_CLOSE_ESC}";
    echo "${KUBE_PS1}"
}

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]\$($ps1_kube) $ "
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]\$(ps1_kube) $ "
export PATH=$PATH:$HOME/bin
SBT_OPTS="-Dsbt.override.build.repos=true \
          -Dfile.encoding=UTF8 \
          -Dhttp.proxyHost=bproxy.tdmz1.bloomberg.com \
          -Dhttp.proxyPort=80 \
          -Dhttp.nonProxyHosts=localhost|127.* \
          -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
export PS1="\W \$"
