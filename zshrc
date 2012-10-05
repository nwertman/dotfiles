# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nwertman"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(ruby osx git)
export DISABLE_AUTO_TITLE="true"   # Don't update the title, let tmux handle that.
source $ZSH/oh-my-zsh.sh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Volumes/Data/Users/local/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Customize to your needs
export PAGER="less -r"
export EDITOR=vim
export SVN_URL="svn+ssh://src/svn"
export HOMEBREWDIR=~/homebrew
export PATH=$HOMEBREWDIR/bin:$PATH:/usr/local/bin:~/bin:/Developer/usr/local/bin:~/bin:~/integration/local/bin
export MANPATH=$HOMEBREWDIR/share/man:$MANPATH

# <rdar://problem/7911203> vim doesn't allow me to enter unicode characters over ssh
export LANG=en_US.UTF-8

# Make sure our AC user is defined properly
export INTLIB_AC_USERNAME=nwertman
export INTLIB_OD_USERNAME=$INTLIB_AC_USERNAME
export INTLIB_TMP_DIR=${HOME}/Work
export SOURCE=~/Source
export SOURCE_PROFESSIONAL=${SOURCE}/Professional
export SOURCE_PERSONAL=${SOURCE}/Personal

# Setup some values for tmux and tmuxinator
export TMUX_DEFAULT_PATH=`tmux show-options | awk '{print $2}' | sed 's/\"//g'`
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Read in our aliases
source ~/.aliases
