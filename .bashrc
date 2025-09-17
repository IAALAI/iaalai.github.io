case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL="ignorespace:ignoredups:erasedups"
HISTSIZE=200
HISTFILESIZE=10000

shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# unset color_prompt force_color_prompt
force_color_prompt=yes
color_prompt=yes

# set prompt
PS1='\[\e[32m\]$(date +"%T")\[\e[37m\]@\[\e[31m\]\h\[\e[34m\]> \[\e[0m\]'


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CFA'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export GOPROXY=https://goproxy.cn,direct

export PATH="$HOME/bin:$PATH"

# 自用的 function
chinese() {
    if [ $# -gt 0 ]; then
        # 有命令参数，仅对这条命令生效
        env LANG=zh_CN.UTF-8 "$@"
    else
        # 无参数，导出到当前 shell
        export LANG=zh_CN.UTF-8
    fi
}

proxy() {
    local proxy_string=$(<~/.proxy)
    local http_url="http://$proxy_string"
    local sock_url="socks5://$proxy_string"

    if [ $# -gt 0 ]; then
        env \
        http_proxy="$http_url" \
        https_proxy="$http_url" \
        all_proxy="$sock_url" \
        HTTP_PROXY="$http_url" \
        HTTPS_PROXY="$http_url" \
        ALL_PROXY="$sock_url" \
        "$@"
    else
        export http_proxy="$http_url"
        export https_proxy="$http_url"
        export all_proxy="$sock_url"
        export HTTP_PROXY="$http_url"
        export HTTPS_PROXY="$http_url"
        export ALL_PROXY="$sock_url"
    fi
}
