export LANG=ja_JP.UTF-8
export KCODE=u

source $HOME/.alias
source $HOME/.setopt
source $HOME/.path

if [ -f /opt/homebrew/opt/asdf/asdf.sh ]; then
    . /opt/homebrew/opt/asdf/asdf.sh
    . /opt/homebrew/opt/asdf/libexec/asdf.sh
    GOV=$(asdf where golang)
    export GOROOT=$GOV/go
fi

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone git@github.com:zdharma-continuum/zinit.git "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node

zinit wait lucid is-snippet for \
    OMZL::git.zsh \
    OMZP::git

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
zinit light zsh-users/zsh-completions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light paulirish/git-open
zinit light zsh-users/zsh-autosuggestions
zinit light lukechilds/zsh-better-npm-completion
