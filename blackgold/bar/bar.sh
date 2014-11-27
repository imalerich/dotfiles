#! /bin/bash

FGCOLOR=\#ff646954
BGCOLOR=\#ff181818

PANEL_HEIGHT=8
bspc config bottom_padding 16

COUNT="$(xrandr -d :0 -q | grep ' connected' | wc -l)"

/home/imalerich/script/bar/panel.sh | bar -u 1 -b -p -B $BGCOLOR -F $FGCOLOR  -g x$PANEL_HEIGT -f "-*-terminus-*-*-*-*-*-*-*-*-*-*-iso10646-*" & 

if [ $COUNT -eq 2 ]
	then	
		/home/imalerich/script/bar/panel.sh | bar -u 1 -b -p -F\$FGCOLOR -B\$BGCOLOR -g 1366x$PANEL_HEIGT+74+900 -u 0 -p -f "-*-terminus-*-*-*-*-*-*-*-*-*-*-iso10646-*"
	fi
