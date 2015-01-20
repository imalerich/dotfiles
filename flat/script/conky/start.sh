#! /bin/bash

COUNT="$(xrandr -d :0 -q | grep ' connected' | wc -l)"
if [ $COUNT -eq 2 ]
	then
		conky -c /home/imalerich/.conkyrc &
		conky -c /home/imalerich/.conkyrc_0 &
	else
		conky -c /home/imalerich/.conkyrc
	fi
