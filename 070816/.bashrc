# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

export GOPATH=$HOME/go
alias ls='ls --color=auto'
export PS1=' \e[;32m\W \e[;33m\]ω\e[0;32m '
alias fuck='sudo $(history -p \!\!)'
alias vimgolf=$HOME/dev/vimgolf/bin/vimgolf
export CXX=g++
export PATH=/usr/local/cuda/bin:$PATH
export C_INCLUDE_PATH=/usr/local/cuda/include:$C_INCLUDE_PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/dev/cudnn/lib64:$LD_LIBRARY_PATH
export C_INCLUDE_PATH=$HOME/dev/cudnn/include:$C_INCLUDE_PATH
