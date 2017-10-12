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

# conky &
compton -b --config $HOME/.config/compton/compton.conf &
devilspie &
texconfig rehash &
xrdb .Xresources &
synergys &
$HOME/.screenlayout/hlayout.sh &

sxhkd &
$HOME/.keyboard.sh &
exec bspwm
