# .bashrc
# The file read by each non-login shell.  .profile is read by 
# login shells, and it includes this file 
# Setup environment variables...

#echo ".bashrc"

export EDITOR=vim
export SVN_URL="svn+ssh://src/svn"
export HOMEBREWDIR=~/homebrew
export PATH=$HOMEBREWDIR/bin:$PATH:/usr/local/bin:~/bin:/Developer/usr/local/bin:~/bin:~/integration/local/bin
export MANPATH=$HOMEBREWDIR/share/man:$MANPATH

# <rdar://problem/7911203> vim doesn't allow me to enter unicode characters over ssh
export LANG=en_US.UTF-8

COLOR_SUCCESS='32'
COLOR_FAILURE='31'
# Customize our prompt
PS1='\W\[\033[00;$(($? ? 31 : 32))m\]-> \[\033[0m\]'

# Add our development area to our python libs
export PYTHONPATH=$PYTHONPATH:~/bin/py_lib

# Make sure our AC user is defined properly
export INTLIB_AC_USERNAME=nwertman
export INTLIB_OD_USERNAME=$INTLIB_AC_USERNAME
export INTLIB_TMP_DIR=${HOME}/Work

# Use a more capable pager
export PAGER="less -r"

# Read in our aliases
source ~/.aliases

set -o vi

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
