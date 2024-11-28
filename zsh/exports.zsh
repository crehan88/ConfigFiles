#!/bin/sh

HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export PATH="$HOME/.local/bin":$PATH
export MANPAGER="nvim +Man!"
export MANWIDTH=999
eval "$(zoxide init zsh)"
#eval "`pip completion --zsh`"
