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

/home/imalerich/.screenlayout/vlayout.sh &
mpd & 
xbanish &
compton -b --config /home/imalerich/.config/compton/comptonrc & 
# /home/imalerich/script/bar/bar.sh &
xrdb .Xresources & 
sxhkd & 
exec bspwm

