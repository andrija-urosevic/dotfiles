# .zshrc
#
# Source syntax highlight
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]];then
    . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

fpath=( "$HOME/.zfunctions" $fpath )

# History stuff
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Variables
export EDITOR="vim"
export BROWSER="firefox"

# colored manuals
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# Some settings
setopt appendhistory autocd beep extendedglob nomatch notify

# Keybindings
bindkey -v

zstyle :compinstall filename '/home/andrija/.zshrc'
## Loading completion and prompt
autoload -Uz compinit promptinit

# Init for completion and prompt
compinit
promptinit
PURE_GIT_DOWN_ARROW=''
PURE_GIT_DOWN_UP=''

# Setting prompt to 'pure'
prompt pure

# autocompletion with an arrow-key driven interface
zstyle ':completion:*' menu select
# enabling autocompletion for privileged environments
zstyle ':completion::complete:*' gain-privilages 1
# automatic rehash
zstyle ':completion:*' rehash true

# autocompletion of command line switches for aliases 
setopt COMPLETE_ALIASES

# Alies
alias ls='ls --color=auto'
alias pacup='sudo pacman -Syu'
alias pacman='sudo pacman'
alias processing='sh ~/processing-3.4/processing'
alias processing-java='sh ~/processing-3.4/processing-java'
alias weather='curl wttr.in'
alias dark='xrdb ~/.Xresurces.dark'
alias light='xrdb ~/.Xresurces.light'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'



