#! /bin/bash

VOL=$(amixer get Master | grep Mono: | cut -c22-23)
printf "%d%%" $VOL
