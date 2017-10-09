#! /bin/sh

cd ./dev/barvis/

COUNT="$(xrandr -d :0 -q | grep ' connected' | wc -l)"

if [ $COUNT -eq 2 ]
    then	
		./barvis -g 1366x29+0+282 &
		./barvis -g 1920x29+1366+0 &
		yabar -c ~/.config/yabar/yabar_multi.conf &
    else
		./barvis -g 1366x29+0+0 &
		yabar -c ~/.config/yabar/yabar_single.conf &
    fi
