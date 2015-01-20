#! /bin/bash

FG="#ff8a8764"
FG1="#ff8a8764"
BG0="#00535233"
BG1="#00535233"
BG2="#ff8a8764"

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
	VOLUME=$(amixer get Master | sed -n 's/^.*\[\([0-9]\+\)%.*$/\1/p'| uniq)

	echo -n "$VOLUME"
}

NowPlaying() {
	PLAYING=$(mpc current)

	echo -n "$PLAYING"
}

Clock() {
	DATE=$(date "+%H:%M")
	
	echo -n "$DATE"
}

Cpu() {
	CPU=$(ps -eo pcpu | awk 'BEGIN {sum=0.0f} {sum+=$1} END {print sum}')

	echo -n "$CPU"
}

Mem() {
	read t f <<< `grep -E 'Mem(Total|Free)' /proc/meminfo |awk '{print $2}'`
    bc <<< "scale=2; 100 - $f / $t * 100" | cut -d. -f1
}

Gpu() {
	GPU=$(nvidia-smi -q -d TEMPERATURE | grep 'GPU Current Temp' | cut -c39-40)
	echo -n "$GPU"
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
	printf "%s\n" "%{l}%{B$BG0} %{B$BG0} %{F$FG}Now Playing %{F$FG1}♫%{B$BG1} %{B$BG2} %{F$BG0}$(NowPlaying) %{B$BG0}%{F$FG} Vol %{F$FG1}$(Volume) %{F$FG}%{B$BG0}%{B$BG1} %{c} %{B$BG1} %{B$BG0} [ $(Workspace) ] %{B$BG1} %{r} %{B$BG1} %{B$BG0} Cpu: %{F$FG1}$(Cpu)%% %{F$FG}Gpu: %{F$FG1}$(Gpu)°C %{F$FG}Mem: %{F$FG1}$(Mem)%% %{F$FG}Battery%{B$BG1} %{F$BG0}%{B$BG2} $(Battery) %{F$FG}%{B$BG1} %{B$BG0}Time %{F$FG1}$(Clock) %{B$BG1}"
	#printf "%s\n" "%{l}%{F$FG} Battery %{B$BG1}%{F$BG0}%{B$BG2} $(Battery) %{F$FG}%{B$BG1} %{B$BG1}%{B$BG0}Cpu: %{F$FG1}$(Cpu)%% %{F$FG}Gpu: %{F$FG1}$(Gpu)°C %{F$FG}Mem: %{F$FG1}$(Mem)%% %{B$BG1}%{c}%{F$FG}Now Playing %{F$FG1}♫%{B$BG1} %{B$BG2} %{F$BG0}$(NowPlaying) %{B$BG0}%{F$FG} Vol %{F$FG1}$(Volume) %{F$FG}%{B$BG0}%{B$BG1} %{B$BG1} %{r} $(Workspace) %{B$BG0}%{B$BG0}%{B$BG0}%{F$FG1} [$(Clock)]%{B$BG1}%{B$BG0} "

	sleep 0.5;
done
