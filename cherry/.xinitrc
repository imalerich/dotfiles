#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

conky --config=$HOME/.config/conky/conkyrc &
conky & 
$HOME/.screenlayout/vlayout.sh &
mpd & 
xbanish &
compton -b --config $HOME/.config/compton/comptonrc & 
$HOME/script/bar/bar.sh &
$HOME/script/wacom/init.sh & 
xrdb .Xresources & 
sxhkd & 
exec bspwm

