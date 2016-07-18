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

$HOME/.screenlayout/hlayout.sh &
compton -b --config $HOME/.config/compton/compton.conf &
xrdb .Xresources &
xmodmap .xmodmap &
sxhkd &
exec bspwm
