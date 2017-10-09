#! /bin/bash

STATUS=$(playerctl status)

cd /home/imalerich/pic/bar/

if [ $STATUS = "Paused" ]; then
    cp play.png play_pause.png
else
    cp pause.png play_pause.png
fi
