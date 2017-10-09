[[ -f ~/.bashrc ]] && source ~/.bashrc
[[ -t 0 && $(tty) == /dev/tty1 && ! $DISPLAY ]] && exec startx

export __GL_THREADED_OPTIMIZATIONS=1
export WINEDEBUG=-all
