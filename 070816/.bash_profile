[[ -f ~/.bashrc ]] && source ~/.bashrc
[[ -t 0 && $(tty) == /dev/tty1 && ! $DISPLAY ]] && exec startx
