#        _           _           
#       | |_ ___ ___| |_ ___ ___ 
#      _| . | .'|_ -|   |  _|  _|
#     |_|___|__,|___|_|_|_| |___|

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\[\033[38;5;44m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;118m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;44m\][\[$(tput sgr0)\]\[\033[38;5;15m\]\w\[$(tput sgr0)\]\[\033[38;5;44m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;209m\]{\[$(tput sgr0)\]\[\033[38;5;15m\]\$?\[$(tput sgr0)\]\[\033[38;5;209m\]}\[$(tput sgr0)\]\[\033[38;5;15m\]\n \\$ \[$(tput sgr0)\]"

# Load organized bash files
if [ -d ${HOME}/.bashrc.d ]; then
    for file in ${HOME}/.bashrc.d/*; do
        source "$file";
    done
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

force_color_prompt=yes

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# NVM Bash completion
export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  


