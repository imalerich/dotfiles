#! /bin/bash
cp .urxvt/.Xresources .urxvt/tmp
schemer -term="urxvt" bg.jpg >> .urxvt/.Xresources
rm ~/.Xresources
mv .urxvt/.Xresources ~/.Xresources
mv .urxvt/tmp .urxvt/.Xresources
xrdb ~/.Xresources
