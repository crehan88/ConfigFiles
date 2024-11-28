#!/bin/sh

alias j='z'
alias f='zi'
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print08 | xargs -I {} -0 git -C {} pull -q"
alias virc='nvim ~/.config/nvim/'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias df="df -h"
alias free="free -m"
alias psmem='ps auxf | sort -nr -k 4 | head -5'
alias pscpu='ps auxf | soer -nr -k 3 | head -5'
alias list_systemctl="systmectl list-unit-files --state=enabled"
alias ls="ls --color=auto"
alias vi="nvim"
alias tmuxls="tmux-load-session"
alias tmuxss="tmux-save-session"
