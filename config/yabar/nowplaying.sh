#! /bin/bash

DATE=$(date +%s)
SONG=$(spotify-now -i "%title, %artist")
SONG="$SONG, $SONG, $SONG, $SONG, $SONG, $SONG, $SONG"
L=$(($DATE % 30))
SUBSTR=${SONG:L:30}
printf "♫ %s ♫" "$SUBSTR"

