export LANG=ja_JP.UTF-8
export KCODE=u

export ZPLUG_HOME=/usr/local/opt/zplug
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000

source $ZPLUG_HOME/init.zsh
source ~/.alias

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'mafredri/zsh-async', from:github
zplug "sindresorhus/pure"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
zplug load

setopt AUTO_CD
setopt nobeep

setopt hist_ignore_dups
setopt EXTENDED_HISTORY

export ANDROID_HOME=/Users/nzk180824d/Library/Android/sdk
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_151.jdk/Contents/Home
export PYENV_ROOT="$HOME/.pyenv"

export PATH=/usr/local/Cellar/openssl/1.0.2m/bin:$PATH
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH=`pwd`/flutter/bin:$PATH
export NVM_DIR="$HOME/.nvm"

eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(goenv init -)"

export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

export MONO_GAC_PREFIX="/usr/local"
export JENV_ROOT="$HOME/.jenv"
if [ -d "${JENV_ROOT}" ]; then
  export PATH="$JENV_ROOT/bin:$PATH"
  eval "$(jenv init -)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

nvm() {
    unset -f nvm
    source "${NVM_DIR:-$HOME/.nvm}/nvm.sh"
    nvm "$@"
}

alias killalfred='osascript -e "quit application \"Alfred\""'

