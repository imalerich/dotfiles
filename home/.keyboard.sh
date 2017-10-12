#! /bin/bash

setxkbmap -option ctrl:nocaps
xmodmap $HOME/.Xmodmap
xcape -e 'Control_L=Escape'
