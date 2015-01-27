#! /bin/bash

PANEL_HEIGHT=12

COUNT="$(xrandr -d :0 -q | grep ' connected' | wc -l)"


if [ $COUNT -eq 2 ]
	then
		/home/imalerich/script/bar/panel.sh | bar -p -g 1920x$PANEL_HEIGT -f "-*-terminus-*-*-*-*-*-*-*-*-*-*-iso10646-*" & 
		/home/imalerich/script/bar/panel.sh | bar -p -g 1366x$PANEL_HEIGHT+0+1080 -f "-*-terminus-*-*-*-*-*-*-*-*-*-*-iso10646-*" &
	else

		/home/imalerich/script/bar/panel.sh | bar -p -g 1366$PANEL_HEIGT -f "-*-terminus-*-*-*-*-*-*-*-*-*-*-iso10646-*" & 
	fi
