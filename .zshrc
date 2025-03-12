export LANG=ja_JP.UTF-8
export KCODE=u
export GPG_TTY=$TTY

source $HOME/.alias
source $HOME/.setopt
source $HOME/.path

eval "$(sheldon source)"
autoload -Uz compinit

function fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history
