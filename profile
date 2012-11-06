COLOR_SUCCESS='32'
COLOR_FAILURE='31'
# Customize our prompt
PS1='\W\[\033[00;$(($? ? 31 : 32))m\]-> \[\033[0m\]'

export EDITOR=/usr/bin/vim
export SHELL=/bin/zsh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
