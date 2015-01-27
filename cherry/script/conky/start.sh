#! /bin/bash

COUNT="$(xrandr -d :0 -q | grep ' connected' | wc -l)"
if [ $COUNT -eq 2 ]
	then
		conky -c $HOME/.conkyrc &
		conky -c $HOME/.config/conky/.conkyrc &
	else
		conky -c $HOME/.conkyrc
	fi
