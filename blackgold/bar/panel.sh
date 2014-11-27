#! /bin/bash

FG="#ff181818"
BG0="#fff4c56b"
BG1="#ff181818"
BG2="#ff957745"

Workspace() {
	SPACE_NUM=$(bspc query -D -d);
		case "$SPACE_NUM" in
			"I")
				WORKSPACE="● ○ ○ ○ ○ ○ ○ ○ ○ ○";;
			"II")
				WORKSPACE="○ ● ○ ○ ○ ○ ○ ○ ○ ○";;
			"III")
				WORKSPACE="○ ○ ● ○ ○ ○ ○ ○ ○ ○";;
			"IV")
				WORKSPACE="○ ○ ○ ● ○ ○ ○ ○ ○ ○";;
			"V")
				WORKSPACE="○ ○ ○ ○ ● ○ ○ ○ ○ ○";;
			"VI")
				WORKSPACE="○ ○ ○ ○ ○ ● ○ ○ ○ ○";;
			"VII")
				WORKSPACE="○ ○ ○ ○ ○ ○ ● ○ ○ ○";;
			"VIII")
				WORKSPACE="○ ○ ○ ○ ○ ○ ○ ● ○ ○";;
			"IX")
				WORKSPACE="○ ○ ○ ○ ○ ○ ○ ○ ● ○";;
			"X")
				WORKSPACE="○ ○ ○ ○ ○ ○ ○ ○ ○ ●";;
		esac
	echo -n $WORKSPACE
}

Volume() {
	VOLUME=$(amixer get Master | grep Mono: | cut -c22-23)

	echo -n "$VOLUME"
}

Clock() {
	DATE=$(date "+%H:%M")
	
	echo -n "$DATE"
}

Battery() {
	BAT=$(acpi --battery | awk '{ gsub(/[,%]/, ""); print $4 }')

	if [ $BAT -ge 90 ] 
	then
		BATTERY="▮▮▮▮▮▮▮▮▮▮"
	elif [ $BAT -ge 80 ]
	then
		BATTERY="▮▮▮▮▮▮▮▮▮▯"
	elif [ $BAT -ge 70 ]
	then
		BATTERY="▮▮▮▮▮▮▮▮▯▯"
	elif [ $BAT -ge 60 ]
	then
		BATTERY="▮▮▮▮▮▮▮▯▯▯"
	elif [ $BAT -ge 50 ]
	then
		BATTERY="▮▮▮▮▮▮▯▯▯▯"
	elif [ $BAT -ge 40 ]
	then
		BATTERY="▮▮▮▮▮▯▯▯▯▯"
	elif [ $BAT -ge 30 ]
	then
		BATTERY="▮▮▮▮▯▯▯▯▯▯"
	elif [ $BAT -ge 20 ]
	then
		BATTERY="▮▮▮▯▯▯▯▯▯▯"
	elif [ $BAT -ge 10 ]
	then
		BATTERY="▮▮▯▯▯▯▯▯▯▯"
	elif [ $BAT -ge 0 ]
	then
		BATTERY="▮▯▯▯▯▯▯▯▯▯▯"
	fi

	echo -n "$BATTERY"
}

while true; do
	printf "%s\n" "%{l}%{B$BG0} %{F$FG}Volume %{B$BG1} %{B$BG2} %{F$BG0}$(Volume) %{F$FG}%{B$BG0}%{B$BG1} %{c} %{B$BG1} %{B$BG0} $(Workspace) %{B$BG1} %{r} %{B$BG1} %{B$BG0} Battery %{B$BG1} %{F$BG0}%{B$BG2} $(Battery) %{F$FG}%{B$BG1} %{B$BG0} Time $(Clock) %{B$BG1}"

	sleep 0.5;
done
